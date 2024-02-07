# Variavés de inicialização
$azAccountEmail = "Email-da-conta"
$azAccountPassword = "Senha-do-email"
$azTentantID = "Tentant-ID"

$resourceGroupName = "Grupo_Recursos"
$vmName = "Nome_da_VM"

$vmUser = "usuario-local"
$vmPassword = "senha-local"

$vmPublicIP = "IP_Publico_da_VM"
$scriptPath = "C:\Caminho\Para\Start.bat"

# Conectando-se ao Azure
Connect-AzAccount -Credential $cred -TenantId $azTentantID

Start-AzVM -ResourceGroupName $resourceGroupName -Name $vmName -force

# Aguarde alguns segundos após a inicialização da VM antes de executar o script
Start-Sleep -Seconds 120  # Ajuste conforme necessário

# Conecte à VM e execute o script
$secpasswd = ConvertTo-SecureString $vmPassword -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential ($vmUser, $secpasswd)

# Use Enter-PSSession para se conectar à VM
Enter-PSSession -ComputerName $vmPublicIP -Credential $credential

# Execute o script na VM
Invoke-Command -ScriptBlock {
    param($scriptPath)
    Start-Process $scriptPath -NoNewWindow -Wait
} -ArgumentList $scriptPath

# Sair da sessão
Exit-PSSession

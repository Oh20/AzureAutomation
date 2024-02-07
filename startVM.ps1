# Definir variáveis
$resourceGroupName = "Grupo_Recursos"
$vmName = "Nome_da_VM"

$username = "Usuario_de_Acesso"
$password = ConvertTo-SecureString "SenhaDeAcesso" -AsPlainText -Force
$cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $username, $password

# Autenticação sem prompt
Connect-AzAccount -Credential $cred -TenantId "Tenant-ID"

# Iniciar a VM
Start-AzVM -ResourceGroupName $resourceGroupName -Name $vmName -force
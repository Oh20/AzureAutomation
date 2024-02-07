# Definir variáveis
$resourceGroupName = "Grupo_de_Recursos"
$vmNames = @("VM-1", "VM-2", "VM-3", "VM-4")

$username = "Email_de_usuario"
$password = ConvertTo-SecureString "Senha_acesso" -AsPlainText -Force
$cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $username, $password

# Autenticação sem prompt
Connect-AzAccount -Credential $cred -TenantId "Tenant-ID"

# Loop sobre a lista de VMs
foreach ($vmName in $vmNames) {
    # Iniciar a VM
    Start-AzVM -ResourceGroupName $resourceGroupName -Name $vmName -force
}
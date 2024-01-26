# Defina suas variáveis
$resourceGroupName = "NomeDoGrupoDeRecursos"
$vmName = "NomeDaVM"
$vmUser = "antony.matheus"
$vmPassword = "Placeholder123"

# Autenticar no Azure (uma vez por sessão)
az login

# Iniciar a VM
Start-AzVM -ResourceGroupName $resourceGroupName -Name $vmName

# Aguarde alguns segundos para garantir que a VM está iniciada
Start-Sleep -Seconds 60  # Ajuste conforme necessário

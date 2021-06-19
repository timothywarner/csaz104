# Ref: https://docs.microsoft.com/en-us/azure/role-based-access-control/tutorial-custom-role-powershell

Get-AzRoleDefinition -Name 'Storage Account Contributor' | ConvertTo-Json | Out-File ./stgcontrib.json

Get-AzRoleDefinition -Name 'Storage Blob Data Contributor' | ConvertTo-Json | Out-File ./blobcontrib.json

Get-AzProviderOperation 'Microsoft.Compute/*' | Format-Table -Property Operation, Description -AutoSize

Get-AzProviderOperation 'Microsoft.Storage/*' | Format-Table -Property Operation, Description -AutoSize

Get-AzRoleDefinition -Name 'Reader' | ConvertTo-Json | Out-File 'D:\ReaderSupportRole.json'

Get-AzSubscription | Select-Object -Property id

New-AzRoleDefinition -InputFile 'C:\ReaderSupportRole.json'

Get-AzRoleDefinition | Where-Object -FilterScript { $_.IsCustom -eq $true } | Format-Table -Property Name, IsCustom

Get-AzRoleDefinition 'Help Desk Support' | Remove-AzRoleDefinition -Force

Get-AzRoleDefinition | ? { $_.IsCustom -eq $true } | Remove-AzRoleDefinition -Force

Remove-AzRoleDefinition -Id '22222222-2222-2222-2222-222222222222'
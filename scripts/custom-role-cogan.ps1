Ref: https://samcogan.com/custom-azure-rbac-roles/

Get-AzureRmRoleDefinition -Name "Virtual Machine Contributor" | ConvertTo-Json | Out-File "D:\csvm.json"

code D:\csvm.json

Get-AzureRmProviderOperation "Microsoft.Compute/*" | Format-List Operation

# Add "Microsoft.Compute/Disks*",

New-AzureRmRoleDefinition -InputFile 'D:\csvm.json'

Get-AzRoleDefinition | Where-Object -FilterScript { $_.IsCustom -eq $true } | Format-Table -Property Name, IsCustom

Get-AzRoleDefinition 'Help Desk Support' | Remove-AzRoleDefinition -Force

Get-AzRoleDefinition | Where-Object { $_.IsCustom -eq $true } | Remove-AzRoleDefinition -Force

Remove-AzRoleDefinition -Id '22222222-2222-2222-2222-222222222222'

## 10 Azure Resource Manager Templates Proven Practices

> **Presenter**: Tim Warner
> **Email**: timothywarner316@gmail.com
> **Twitter**: @TechTrainerTim
> **Website**: https://techtrainertim
> **Page link**: https://timw.info/armpp

### 1. Develop an Azure resource naming convention

* [Microsoft's naming and tagging guidance](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/naming-and-tagging)

## 2. Create a solid template development environment

* [Visual Studio Code](https://code.visualstudio.com/)
* [PowerShell 7](https://github.com/PowerShell/powershell/releases)
* [PowerShell VS Code extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode.PowerShell)
* [ARM Tools VS Code extension](https://marketplace.visualstudio.com/items?itemName=msazurermtools.azurerm-vscode-tools)
* [Azure CLI Tools VS Code extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode.azurecli)
* [Bicep CLI](https://github.com/Azure/bicep/blob/main/docs/installing.md)
* [Project Bicep VS Code extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-bicep)

### 3. Understand ARM template syntax

* [Template structure and syntax](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-syntax)
* [ARM template reference](https://docs.microsoft.com/en-us/azure/templates/)
* [Azure Quickstart Templates](https://github.com/Azure/azure-quickstart-templates)
* [Tim's ARM templates tutorial](https://timwinfo-my.sharepoint.com/:x:/g/personal/tim_timw_info/EQRooL1BhnRMjaIx6WEovRYBDXbzHOI1CrtpNls3zesDHw?rtime=VntXnCDU2Eg)

### 4. Use the "T-shirt size" metaphor

* [Think Rethink](https://thinkrethink.net/2016/09/06/creating-a-t-shirt-size-arm-template/)
* [endjin](https://endjin.com/blog/2016/12/advanced-azure-resource-manager-template-patterns-t-shirt-sizing-and-optional-resources)

### 5. Handle parameters with variables

* [Parameters in templates](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-parameters)
* [Variables in templates](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-variables)

### 6. Master ARM template expressions and functions

* [Template expressions](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-expressions)
* [Template built-in functions](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-functions)

### 7. Protect secrets

* [Use Azure Key vault in templates](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-tutorial-use-key-vault)

### 8. Consider linked templates

* [Link deployment templates](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/linked-templates)

### 9. Test templates

* [Barbara Forbes](https://4bes.nl/2020/08/09/testing-arm-templates/)
* [Whatif operation](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-deploy-what-if?tabs=azure-powershell)
* [Pester](https://github.com/pester/Pester)
* [Pester and ARM templates tutorial](https://medium.com/charot/test-arm-templates-using-pester-azure-devops-837b5006c30c)
* [ARM Template Toolkit](https://github.com/Azure/arm-ttk)
* [ARM-TTK tutorial](https://msftplayground.com/2020/01/testing-arm-templates/)

### 10. Include ARM templates in your CI/CI pipeline

* [Azure DevOps](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/add-template-to-azure-pipelines)
* [GitHub Actions](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/deploy-github-actions)

### Bonus: Azure Bicep

* [Repo](https://github.com/Azure/bicep)
* [Build5nines](https://build5nines.com/get-started-with-azure-bicep/)

### References

* [Microsoft](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-best-practices)
* [Sam Cogan](https://sharegate.com/blog/take-your-azure-resource-manager-arm-template-game-to-next-level)
* [Deloitte](https://platform.deloitte.com.au/articles/arm-template-lifecycle-management-dos-and-donts)
* [Frank Boucher](https://fboucheros.medium.com/5-simple-steps-to-get-a-clean-azure-resource-manager-arm-template-4ef8e18c64e8)
* [Wintellect](https://www.wintellect.com/azure-arm-template-tips/)

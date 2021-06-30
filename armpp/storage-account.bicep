param location string = 'eastus'
param storageAccountName string = 'twbicepstg01'

var storageSkuName = 'Standard_LRS'

resource mystorage 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: '${storageAccountName}'   // Globally unique storage account name
  location: '${location}' // Azure Region
  kind: 'Storage'
  sku: {
    name: 'Standard_LRS'
  }
}

output storageAccountId string = mystorage.id
param webAppName string
output hostname string = webApp.properties.defaultHostName 

resource appService 'Microsoft.Web/serverfarms@2023-12-01' = {
  name: 'demo-app-service'
  location: resourceGroup().location
  sku: {
    name: 'F1'
    capacity: 1
  }
  properties: {
    reserved: true
  }
}

resource webApp 'Microsoft.Web/sites@2023-12-01' = {
  name: webAppName
  location: resourceGroup().location
  properties: {
    serverFarmId: resourceId('Microsoft.Web/serverfarms', 'demo-app-service')
  }
  dependsOn: [appService]
}

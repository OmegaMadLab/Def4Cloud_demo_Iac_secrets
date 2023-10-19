@secure()
param adminPassword string = '$trongPwd'

var location = 'westeurope'

resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: 'appPlan'
  location: location
  sku: {
    name: 'F1'
    capacity: 1
  }
}

resource webApplication 'Microsoft.Web/sites@2022-09-01' = {
  name: 'name'
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      connectionStrings: [
        {
          name: 'demo'
          connectionString: 'Server=myServerAddress;Database=myDataBase;User Id=myUsername;Password=myPassword;'
        }
      ]
      ftpsState: 'AllAllowed'
      minTlsVersion: '1.0'
    }
  }
}

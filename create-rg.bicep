targetScope = 'subscription'
param rgName string

resource newRG 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: rgName
  location: 'eastus'
  tags: {dynamically-provisioned: 'True'}
}

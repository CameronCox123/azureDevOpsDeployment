# Introduction
This repository is intended to be used in conjuncition with Azure DevOps to deploy an Azure Web App and App Service to a newly created Resource Group.

# Build and Test
Firstly make sure you have an Azure Subscription and Azure DevOps account. 
Create a project in Azure Devops and upload the create-rg.bicep and webAppDeploymentDemo.bicep files to the main repo.
Copy the azure-pipelines.yml file to a github repo. 
Create a service connection to your github in azure devops. This can be found in yourProject/projectSettings/pipelines/serviceConnections.
Finally create an Azure pipeline to deploy the web app and app service. 

Select New Pipeline, Github, select the Github repo where the .yml file is located, configure your file from existing Azure Pipelines YML file, set your path to the .yml file, and create your pipeline. 
This should take a couple minutes to deploy so be patient and check the job status for any errors. 

# Modification
We are building from two bicep files and running Azure CLI commands through a .yml file on an Azure Pipeline to deploy these resources. 
By default, the CLI command in this repo uses the buildID of the pipeline to create the resource group name and web app name.

If you want to change the location or name, simply edit the CLI line below and replace it in the .yml file.

      az deployment sub create -l <location> -f create-rg.bicep --parameters rgName=<your-resource-group-name>
To edit the web app name, edit the CLI line below and replace it in the .yml file. Note, your-resource-group-name MUST be the same in both CLI lines.
     
      az deployment group create -g <your-resource-group-name> -f webAppDeploymentDemo.bicep --parameters webAppName=<your-web-app-name>

*Tags and Outputs*

By default, create-rg.bicep has a 'tags' line with a few temporary tags. It's reccomended that you replace these with meaningful tags for your personal use, or delete them if not necessary.
Additionally, webAppDeploymentDemo.bicep has an output line that will return the hostname of your web app. This is also not necessary and fine to remove.


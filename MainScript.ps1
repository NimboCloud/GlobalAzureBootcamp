
Login-AzureRmAccount -SubscriptionId  f794c958-ef55-4f8c-834b-a90d282fb3bd 
#Remove-AzureRmResourceGroup -Name bootcampnyc

New-AzureRmResourceGroup -Name sr-bootcamp1 -Location 'East US' -Force

$Deployment = @{
	Name='shashideployment1';
	ResourceGroupName='sr-bootcamp1';
	Mode='Complete';
	#TemplateFile="$PSScriptRoot\azure.json";
	TemplateFile="C:\projects\AzureBootCampV1\DeploymentScript\azure-C_WEB.json";
	TemplateParameterObject =@{
		StorageAccountName='srbootcamp1';
		adminUsername='shashi';
		adminPassword='Raina123!'; 
		dnsNameForPublicIP1='sr-bootcamp10';
		dnsNameForPublicIP2='sr-bootcamp20';
		dnsNameforLBIP= 'sr-bootcamplb0';
	}

}
New-AzureRmResourceGroupDeployment  @Deployment;


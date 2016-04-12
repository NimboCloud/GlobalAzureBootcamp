
Login-AzureRmAccount -SubscriptionId  [Your ID]
#Remove-AzureRmResourceGroup -Name bootcampnyc

New-AzureRmResourceGroup -Name rgrainas -Location 'East US' -Force

$Deployment = @{
	Name='shashideployment1';
	ResourceGroupName='rgrainas';
	Mode='Complete';

	TemplateFile="C:\projects\AzureBootCampV1\DeploymentScript\azure-C_WEB.json";
	TemplateParameterObject =@{
		StorageAccountName='strainas'; #globally unique
		adminUsername='shashi';
		adminPassword='*****'; // Uppercase, letter and special character
		dnsNameForPublicIP1='ip1rainas'; #globally unique
		dnsNameForPublicIP2='ip2rainas'; #globally unique
		dnsNameforLBIP= 'lbrainas'; #globally unique
	}

}
New-AzureRmResourceGroupDeployment  @Deployment;


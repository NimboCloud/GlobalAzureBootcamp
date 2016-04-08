
Login-AzureRmAccount -SubscriptionId  [SUB ID]
#Remove-AzureRmResourceGroup -Name bootcampnyc

New-AzureRmResourceGroup -Name sr-bootcamp -Location 'East US' -Force

$Deployment = @{
	Name='shashideployment';
	ResourceGroupName='sr-bootcamp';
	Mode='Complete';
	#TemplateFile="$PSScriptRoot\azure.json";
	TemplateFile="C:\projects\AzureBootCampV1\DeploymentScript\azure-C.json";
	TemplateParameterObject =@{
		StorageAccountName='srbootcamp';
		adminUsername='shashi';
		adminPassword='Raina123!'; # 1 UPPER CASE, SPECIAL CHARACTER, NUMBER AND min 8 character lenght
		dnsNameForPublicIP1='sr-bootcamp1';
		dnsNameForPublicIP2='sr-bootcamp2';
		dnsNameforLBIP= 'sr-bootcamplb';
	}

}
New-AzureRmResourceGroupDeployment  @Deployment;


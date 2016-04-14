Login-AzureRmAccount -SubscriptionId  "YourId";

$userName = "GlobalyUniqueUserName";
$templateFile = "azure-A.json";

#-----------------------------------------#
# Nothing below here needs to be modified #
#-----------------------------------------#

$deploymentName = "deployment";
$rgname = "rg" + $userName;
New-AzureRmResourceGroup -Name $rgname -Location "East US" -Force

$Deployment = @{
	Name = $userName + $deployment;
	ResourceGroupName = $rgname;

	TemplateFile = $templateFile;
	TemplateParameterObject = @{
		StorageAccountName = "st" +$userName;
    adminUsername = $userName;
		adminPassword = "BootCamp2016!";
		dnsNameForPublicIP1 = "ip1" + $userName;
		dnsNameForPublicIP2 = "ip2" + $userName;
		dnsNameforLBIP = "lb" + $userName;
	}

}

New-AzureRmResourceGroupDeployment  @Deployment;
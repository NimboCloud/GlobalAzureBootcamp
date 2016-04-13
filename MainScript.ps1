#Login-AzureRmAccount -SubscriptionId  "f794c958-ef55-4f8c-834b-a90d282fb3bd";
#Remove-AzureRmResourceGroup -Name bootcampnyc
$userName = "byoung55";
$templateFile = "azure-C.json";

#-----------------------------------------#
# Nothing below here needs to be modified #
#-----------------------------------------#
$deploymentName = "deployment";
$rgname="rg" + $userName;
New-AzureRmResourceGroup -Name $rgname -Location "East US" -Force

$Deployment = @{
	Name=$userName + $deployment;
	ResourceGroupName= $rgname;

	TemplateFile=$templateFile;
	TemplateParameterObject =@{
		StorageAccountName="st" +$userName; #globally unique
		adminUsername=$userName;
		adminPassword='BootCamp2016!'; # Uppercase, letter and special character
		dnsNameForPublicIP1="ip1" + $userName; #globally unique
		dnsNameForPublicIP2="ip2" + $userName; #globally unique
		dnsNameforLBIP= "lb" + $userName; #globally unique
	}

}
New-AzureRmResourceGroupDeployment  @Deployment;


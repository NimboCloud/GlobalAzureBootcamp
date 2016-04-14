Login-AzureRmAccount -SubscriptionId  "00000000-ef55-4f8c-834b-a90d282fb3bd";

$userName = "johnsmith";
$templateFile = [environment]::getfolderpath("mydocuments") + "\\GitHub\\GlobalAzureBootcamp\\azure-C.json";

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
		StorageAccountName = "st" + $userName;
		adminUsername = $userName;
		adminPassword = "BootCamp2016!";
		dnsNameForPublicIP1 = "ip1" + $userName;
		dnsNameForPublicIP2 = "ip2" + $userName;
		dnsNameforLBIP = "lb" + $userName;
	}
}

New-AzureRmResourceGroupDeployment @Deployment;

#Popup a window to notify the user that the action has completed.
$wScriptShell = New-Object -ComObject Wscript.Shell;
$wScriptShell.Popup("New-AzureRmResourceGroupDeployment Finished: $templateFile",0,"New-AzureRmResourceGroupDeployment Finished!",0x1);
# GlobalAzureBootcamp
Attending the Global Azure Bootcamp 2016? This repository contains the materials needed for the labs!

-  Contains 3 JSON modules : A, B and C.  
-                              Module A: Builds foundation resources
-                              Module B: Builds load balancer
-                              Module C: Builds VM 
-                              Module D: Builds VM and applies DSC for website deployment
                    
-
-  2 powershell script files:
-                            MainScript.ps1 is the execution script for creating resource group. 
-                            AddWebSite.ps1 is DSC file to add IIS role and website binaries


Steps to open the code:

1) Download the code as zip file to local folder

2) Open the "DeploymentScript.sln" file in Visual Studio and the entire project should open up with all the code files

Download Source for sample Website code (For PaaS deployment):

https://github.com/NimboCloud/GlobalAzureBootcamp-Website

DSC code snippet:
vm1:

 "settings": {
 
                            "ModulesUrl": "[parameters('vmDSCExtensionModulesUrl')]", //The url to the
                            
                            "sasToken": "[parameters('artifactsLocationSasToken')]",
                            
                            "configurationFunction": "[parameters('vmDSCExtensionConfigurationFunction')]", //The function to call, in the format azuredkwebsite.ps1\\azuredkwebsite
                            
                            "properties": {
                            
                                "MachineName": "[variables('vmName1')]",
                                
                                //Add the extra parameters the new DSC module needs
                                
                                "WebDeployPackagePath": "[parameters('vmDSCDeployPackageUrl')]"
                              
                            }
                        },




vm2:

 "settings": {
 
                            "ModulesUrl": "[parameters('vmDSCExtensionModulesUrl')]", //The url to the
                            
                            "sasToken": "[parameters('artifactsLocationSasToken')]",
                            
                            "configurationFunction": "[parameters('vmDSCExtensionConfigurationFunction')]", //The function to call, in the format azuredkwebsite.ps1\\azuredkwebsite
                            
                            "properties": {
                            
                                "MachineName": "[variables('vmName2')]",
                                
                                //Add the extra parameters the new DSC module needs
                                
                                "WebDeployPackagePath": "[parameters('vmDSCDeployPackageUrl')]"
                               
                            }
                        },
                        
    



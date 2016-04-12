Configuration bootcampwebsite
{
	

  param (
    $MachineName,
    $WebDeployPackagePath
   
    )
	
	

  Node $MachineName
  {
    #Install the IIS Role
    WindowsFeature IIS
    {
      Ensure = "Present"
      Name = "Web-Server"
    }

    #Install ASP.NET 4.5
    WindowsFeature ASP
    {
      Ensure = "Present"
      Name = "Web-Asp-Net45"
    }
    #Install IIS Management Console 
    WindowsFeature WebServerManagementConsole
    {
        Name = "Web-Mgmt-Console"
        Ensure = "Present"
    }
    
	 
    
    #Download the Website Package 
    Script DeployWebPackage
    {
      GetScript = {
              @{
                  Result = ""
              }
          }
          TestScript = {
              $false
          }
          SetScript ={
		  $WebClient = New-Object -TypeName System.Net.WebClient
          $Destination= "C:\WindowsAzure\WebApplication.zip" 
          $WebClient.DownloadFile($using:WebDeployPackagePath,$destination)   
		  
          }

		}

	   #unzip and copy the website content
	  
	 Archive ArchiveExample {
    Ensure = "Present"  # You can also set Ensure to "Absent"
    Path = "C:\WindowsAzure\WebApplication.zip"
    Destination = "c:\inetpub\"
    DependsOn="[Script]DeployWebPackage"
    }

	 
		}
	  

	}

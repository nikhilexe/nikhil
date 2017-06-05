#Copy-Item $applicationPath\FabrikamFiber.CallCenter\DSCModule\* $env:psmodulepath.split(";")[1] -Force -Recurse

$ConfigData = 
@{
    AllNodes = @(
		@{ NodeName = "*"},

        @{	NodeName = "localhost";
            WebsiteName = "FFWeb"
            WebsiteBitsSourcePath = $applicationPath + "\FabrikamFiber.CallCenter\FabrikamFiber.Web"
			DeploymentPath = $env:SystemDrive + "\inetpub\FFWeb"
            FFExpressConnection = "data source=.;Integrated Security=True;Initial Catalog=FabrikamFiber-Express;User Id='" + "demouser" + "'"
            ConnectionStringProvider = "System.Data.SqlClient"
            WebAppPoolName = "FabrikamPool"
            WebsitePort = "80"
            UserName = "demouser"
            Password = "demouser"
        }
    )
}
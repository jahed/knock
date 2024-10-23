<#
.SYNOPSIS
Given a host, looks up its port sequence and knocks on it.

.DESCRIPTION
Given a host, looks up its port sequence and knocks on it.

Version:   v2.2.1
Homepage:  https://github.com/jahed/knock
Donate:    https://jahed.dev/donate

.PARAMETER TargetHost
Target host. Where you want to knock. Must exist in config file.

.PARAMETER ConfigFile
Config file location. Defaults to ~/.config/knock/hosts.json.

.INPUTS
None.

.OUTPUTS
None.

.EXAMPLE
PS> .\knock.ps1 -ConfigFile .\knock.json example.com

Will knock on example.com at ports 1000 then 2000 then 3000 given the config file:

{
  "example.com": ["1000", "2000", "3000"]
}

.LINK
https://github.com/jahed/knock
#>
param( 
  [Parameter(Mandatory=$true,Position=0)] 
  [String] $TargetHost
  ,
  [Parameter()]
  [ValidateScript({ Test-Path -PathType Leaf $_ })] 
  [String] $ConfigFile="~\.config\knock\hosts.json"
)

Get-Content -Raw ~\.config\knock\hosts.json | ConvertFrom-Json | % { $_.$TargetHost} | ForEach-Object -Process { 
  Start-Job -ScriptBlock {
    Test-NetConnection -ComputerName $TargetHost -Port $_ -InformationLevel Quiet
  } | Wait-Job -Timeout 1 | Out-Null
}

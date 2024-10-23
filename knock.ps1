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

param(
    [Parameter(Mandatory=$true)][string] $RGLocation,
    [Parameter(Mandatory=$true)][string] $RGName
)
$ErrorActionPreference  = "stop"
[console]::ResetColor()
$ScriptName = $MyInvocation.MyCommand.Name

Write-host "----------------------------------------------------"
Write-Host resourcegroup location is $RGLocation
Write-Host resourcegroup name is $RGName
Write-host "----------------------------------------------------"
#Check RG Status
$RGStatus = az group exists -n $RGName
az group create -l $RGLocation -n $RGName

if ($RGStatus -eq $false)
{
    az group create -l $RGLocation -n $RGName
}
else{
    Write-Host resourcegroup $RGName already exists
}
#======================
Write-Host "End of Script ($ScriptName)"


# param(
#     [Parameter(Mandatory=$true)][string] $RGName,
#     [Parameter(Mandatory=$true)][string] $VMImage,
#     [Parameter(Mandatory=$true)][string] $RVnetName,
#     [Parameter(Mandatory=$true)][string] $SubnetName,
#     [Parameter(Mandatory=$true)][string] $URN,
#     [Parameter(Mandatory=$true)][string] $VMUname,
#     [Parameter(Mandatory=$true)][string] $VMPwd,
#     [Parameter(Mandatory=$true)][string] $VMSizex
# )
# $ErrorActionPreference  = "stop"
# [console]::ResetColor()
# $ScriptName = $MyInvocation.MyCommand.Name

# Write-host "----------------------------------------------------"
# Write-Host resourcegroup location is $RGLocation
# Write-Host resourcegroup name is $RGName
# Write-host "----------------------------------------------------"
# #Check RG Status
# $RGStatus = az network exists -n $RGName

# if ($RGStatus -eq $true)
# {
#     az vm create --resource-group HUB-RG --name HUB_WINVM --image $URN --vnet-name $RVnetName --subnet $SubnetName --admin-username $VMUname --admin-password $VMPwd --size $VMSize
# }
# else{
#     Write-Host Network $RGStatus already exists
# }

# #======================
# Write-Host "End of Script ($ScriptName)"

param(
   [Parameter(Mandatory=$true)][string] $RGName,
   [Parameter(Mandatory=$true)][string] $VnetName,
   [Parameter(Mandatory=$true)][string] $SubnetName,
   [Parameter(Mandatory=$true)][string] $Urn,
   [Parameter(Mandatory=$true)][string] $VmName,
   [Parameter(Mandatory=$true)][string] $Username,
   [Parameter(Mandatory=$true)][string] $Password,
   [Parameter(Mandatory=$true)][string] $VmSize

)
$ErrorActionPreference = "Stop"
[Console]::ResetColor()
$scriptName = $MyInvocation.MyCommand.Name
write-host "========================================================="
write-host resourcegroupname is $RGName
write-host vnetname is $VnetName
write-host SubnetName is $SubnetName
Write-Host "=========================================================="

#Checking resourcegroup status. if exits or not
# $vnetStatus = az network vnet exists -g $RGName -n $VnetName
# if($vnetStatus -eq $false){
    Write-Host creating VM
    az vm create --resource-group $RGName --name $VmName --image $Urn --vnet-name $VnetName --subnet $SubnetName --admin-username $Username --admin-password $Password --size $VmSize
# }
# else{
    # Write-Host vnet $VnetName already exists
# }
#==================================================================

Write-Host "----------------------------------------------------"
Write-Host "END OF SCRIPT ($scriptName)"
Write-Host "------------------------------------------"

#Set-StrictMode -Version Latest
#####################################################
# Install-Scripts
#####################################################
<#PSScriptInfo

.VERSION 0.1

.GUID a5809e78-c888-41fe-8c41-b9e2e5d3e090 

.AUTHOR David Walker, Sitecore Dave, Radical Dave

.COMPANYNAME David Walker, Sitecore Dave, Radical Dave

.COPYRIGHT David Walker, Sitecore Dave, Radical Dave

.TAGS powershell sitecore package

.LICENSEURI https://github.com/SharedSitecore/Install-Scripts/blob/main/LICENSE

.PROJECTURI https://github.com/SharedSitecore/Install-Scripts

.ICONURI 

.EXTERNALMODULEDEPENDENCIES 

.REQUIREDSCRIPTS 

.EXTERNALSCRIPTDEPENDENCIES 

.RELEASENOTES

#>

<# 

.DESCRIPTION 
 PowerShell Script to Create Sitecore WDP packages (helper/wrapper for Sitecore Azure Toolkit)

.PARAMETER name
Path of package

#> 
#####################################################
# Install-Scripts
#####################################################

[CmdletBinding(SupportsShouldProcess)]
Param(
	[Parameter(Mandatory=$true)]
	[string[]] $scripts
)
begin {
	$ProgressPreference = "SilentlyContinue"		
	$ErrorActionPreference = 'Stop'
	$PSScriptName = ($MyInvocation.MyCommand.Name.Replace(".ps1",""))
	$PSCallingScript = if ($MyInvocation.PSCommandPath) { $MyInvocation.PSCommandPath | Split-Path -Parent } else { $null }
	Write-Verbose "$PSScriptRoot\$PSScriptName $path called by:$PSCallingScript"

	$scripts.foreach({
		try {
			if (-not (Get-Command -Name $_)) {Install-Script -Name $_ -Confirm:$False -Force }
		}
		catch {
			Write-Error "ERROR Install-Scripts $($path):$_" -InformationVariable results
		}
	})
	Write-Verbose "$PSScriptName $path end"	
}
# Implement your module commands in this script.
. $PSScriptRoot\cmdlets\Get-GitGlobalConfig.ps1
. $PSScriptRoot\cmdlets\Set-DefaultLocation.ps1
. $PSScriptRoot\cmdlets\Reset-Module.ps1
. $PSScriptRoot\cmdlets\Get-ModuleStatus.ps1
. $PSScriptRoot\cmdlets\Remove-ModuleOldVersions.ps1
. $PSScriptRoot\cmdlets\New-StdModule.ps1
# Export only the functions using PowerShell standard verb-noun naming.
# Be sure to list each exported functions in the FunctionsToExport field of the module manifest file.
# This improves performance of command discovery in PowerShell.
Export-ModuleMember -Function *-*

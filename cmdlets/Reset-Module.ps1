function Reset-Module {
    [CmdletBinding()]
    param (
        # Parameter help description
        [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName=$true)] $Name
    )
    begin{
        $exceptions = @("chocolateyProfile", "PowerShellEditorServices.*", "Microsoft.PowerShell.*") 
    }
    process{
        $exceptionFound = $false
        $exceptions | % {
            if($Name -like $_){
                $exceptionFound = $true
            }
        }
        if(!$exceptionFound){
            if((Get-Module).Name -contains $Name) {
                Remove-Module $Name
            }
            Import-Module $Name -Global
        }
    }
}
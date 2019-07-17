function Set-DefaultLocation {
    [CmdletBinding()]
    param(
        [ValidateSet("AllUsersCurrentHost", "AllUsersAllHosts", "CurrentUserAllHosts", "CurrentUserCurrentHost")]$Scope="AllUsersCurrentHost",
        [Parameter(Mandatory = $true)]$Path
    )
    $ErrorActionPreference = "Stop"
    $locationCommand = "Set-Location '$Path'"
    $profilePath = $profile.$Scope

    try {
        Get-Item $Path | Out-Null
    }
    catch {
        throw "The entered path is not valid"
    }

    try{
        $profileData = Get-Content $profilePath
    }
    catch {
        $profileData = @()
        Write-Host "New profile file for scope $Scope created"
    }
    
    
    if (($index = $profileData.indexOf("#Location")) -eq -1) {
        $profileData += "#Location"
        $profileData += "#dummy line" #new line
        $index = $profileData.indexOf("#Location")
    }

    $profileData[$index+1] = $locationCommand
    
    try{
        $profileData | Out-File $profilePath -Force
    } catch {
        throw "An error occurred. Pls try to run in adminstrator shell"
    }

    $profileData = Get-Content $profilePath
    if ($profileData -contains $locationCommand) {
        Write-Host "Path was set as default"
    }
    else {
        throw "Something went wrong. Pls check your powershell profile at $profilePath"
    }
}
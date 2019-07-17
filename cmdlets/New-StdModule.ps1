function New-StdModule {
    [CmdletBinding()]
    param (
        $Name,
        $Path = "C:\Users\brumhard\repos\Modules"
    )

    $plasterDest = $Path
    $defaultTemplate = Get-PlasterTemplate |
        Where-Object -FilterScript {$PSItem.Title -eq 'New PowerShell Manifest Module'}

    Invoke-Plaster -TemplatePath $defaultTemplate.TemplatePath -DestinationPath "$plasterDest\$Name"  -Verbose

    Push-Location $path\$Name
    git init

    ".vscode/*" | Out-File ".gitignore" -Force
}
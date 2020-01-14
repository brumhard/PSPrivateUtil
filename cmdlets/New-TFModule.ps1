function New-TFModule {
    [CmdletBinding()]
    param (
        $Name
    )

    $localPath = (Get-Location).Path
    $folder = New-Item -Path $(Join-Path -Path $localPath -ChildPath $Name) -ItemType Directory
    foreach ($item in @("main.tf", "outputs.tf", "variables.tf")){
        New-Item -Path $(Join-Path -Path $folder.FullName -ChildPath $item) -ItemType File
    }
}
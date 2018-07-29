function Move-Path {
    param($sourceFile, $destinationPath)

    if( -Not (Test-Path -Path $destinationPath ) )
    {
        Write-Host "Creating $destinationPath"
        New-Item -ItemType directory -Path $destinationPath -Force | Out-Null
    }
    else
    {
        Write-Host "$destinationPath exists"
    }

    Write-Host "Moving $sourceFile to $destinationPath"
    Move-Item -Path $sourceFile -Destination $destinationPath -Force
    Write-Host "Done"
}

function Delete-EmptyDirectories {
    param($folderName)
    Write-Host "Deleting empty directories from $folderName"
    dir $folderName -Directory -recurse | where {-NOT $_.GetFiles("*","AllDirectories")} | del -recurse
    Write-Host "Done"
}


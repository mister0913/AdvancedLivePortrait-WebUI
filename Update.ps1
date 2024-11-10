try {
    git pull origin master 2>$null
    if ($LASTEXITCODE -eq 0) {
        Write-Output "Successfully updated WebUI."
    } else {
        throw
    }
} catch {
    git reset --hard
    git pull origin master
    Write-Output "Successfully updated WebUI."
}

pause

if (-Not (Test-Path -Path "$PSScriptRoot\venv\Scripts")) {
    Write-Output "Creating venv..."
    python -m venv venv
}

Write-Output "Checked the venv folder. Now installing requirements..."

Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force

& "$PSScriptRoot\venv\Scripts\Activate.ps1"

python -m pip install -U pip
pip install -r requirements.txt

if ($LASTEXITCODE -ne 0) {
    Write-Output ""
    Write-Output "Requirements installation failed. Please remove the venv folder and run the script again."
} else {
    Write-Output ""
    Write-Output "Requirements installed successfully."
}

Read-Host -Prompt "Press Enter to continue..."

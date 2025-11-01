<#
Simple run helper for Windows PowerShell.
Usage: open PowerShell in the project root and run: .\run.ps1
It will create a virtual environment `.venv`, install dependencies from `requirements.txt`, and run `final_pred.py`.
#>

Set-StrictMode -Version Latest

$projectRoot = Split-Path -Path $MyInvocation.MyCommand.Path -Parent
Write-Host "Project root: $projectRoot"

Push-Location $projectRoot

if (-not (Test-Path -Path .venv)) {
    Write-Host "Creating virtual environment .venv..."
    python -m venv .venv
}

Write-Host "Activating venv..."
. .\venv\Scripts\Activate.ps1

Write-Host "Upgrading pip and installing requirements..."
python -m pip install --upgrade pip setuptools wheel
if (Test-Path requirements.txt) {
    pip install -r requirements.txt
} else {
    Write-Host "requirements.txt not found; you can install dependencies manually."
}

Write-Host "Running the GUI demo (final_pred.py)..."
python final_pred.py

Pop-Location
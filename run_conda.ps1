# Run the project using the conda env 'slt' without requiring conda activation in the shell
# Usage: Open PowerShell in the repo root and run: .\run_conda.ps1

$envPython = "C:\\Users\\smuru\\Miniconda3\\envs\\slt\\python.exe"
if (-Not (Test-Path $envPython)) {
    Write-Error "Python executable not found at $envPython. If you installed Miniconda to a different location, update this script."
    exit 1
}

Write-Host "Launching final_pred.py with: $envPython"
& $envPython "./final_pred.py"

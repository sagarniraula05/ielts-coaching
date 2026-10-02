# Opens timer.ps1 in a new window so the class chat stays free.
# Usage: powershell -NoProfile -ExecutionPolicy Bypass -File tools/start-timer.ps1 -Minutes 40 -Task "Writing Task 2"

param(
    [int]$Minutes = 40,
    [string]$Task = "IELTS Task"
)

$timer = Join-Path $PSScriptRoot "timer.ps1"
$argList = @(
    "-NoProfile", "-ExecutionPolicy", "Bypass",
    "-File", "`"$timer`"",
    "-Minutes", "$Minutes",
    "-Task", "`"$Task`""
)
Start-Process powershell -ArgumentList $argList
Write-Output ("Timer started: {0} minutes for '{1}' at {2}" -f $Minutes, $Task, (Get-Date -Format "HH:mm:ss"))

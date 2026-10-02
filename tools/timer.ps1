# IELTS countdown timer for Windows (PowerShell)
# Usually opened by the teacher through start-timer.ps1, in its own window.
# Direct use: powershell -ExecutionPolicy Bypass -File timer.ps1 -Minutes 40 -Task "Writing Task 2"

param(
    [int]$Minutes = 40,
    [string]$Task = "IELTS Task"
)

$host.UI.RawUI.WindowTitle = "IELTS Timer - $Task"
$end = (Get-Date).AddMinutes($Minutes)
$warned = $false

while ((Get-Date) -lt $end) {
    $left = $end - (Get-Date)
    Clear-Host
    Write-Host ""
    Write-Host "   $Task" -ForegroundColor Cyan
    Write-Host ""
    Write-Host ("   Time left:  {0:hh\:mm\:ss}" -f $left) -ForegroundColor Yellow

    # One warning beep when 5 minutes are left
    if (-not $warned -and $left.TotalMinutes -le 5) {
        [console]::Beep(800, 400)
        $warned = $true
    }
    Start-Sleep -Seconds 1
}

Clear-Host
Write-Host ""
Write-Host "   TIME UP! Stop writing and send your answer to your teacher." -ForegroundColor Red
for ($i = 0; $i -lt 3; $i++) { [console]::Beep(1000, 600); Start-Sleep -Milliseconds 200 }
Write-Host ""
Read-Host "   Press Enter to close this window"

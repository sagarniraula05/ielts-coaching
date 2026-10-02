# Prints the time and saved class state when a Claude Code session starts.
# Claude Code adds this output to the teacher's context automatically.

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$root = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)

Write-Output ("CURRENT TIME: " + (Get-Date -Format "dddd, yyyy-MM-dd HH:mm"))
Write-Output ""

$files = @("student/current-class.md", "student/homework.md")
foreach ($f in $files) {
    $path = Join-Path $root $f
    if (Test-Path $path) {
        Write-Output "===== $f ====="
        Get-Content -Path $path -Encoding UTF8 | Write-Output
        Write-Output ""
    }
}

$att = Join-Path $root "student/attendance.md"
if (Test-Path $att) {
    Write-Output "===== student/attendance.md (last 5 lines) ====="
    Get-Content -Path $att -Encoding UTF8 | Select-Object -Last 5 | Write-Output
}

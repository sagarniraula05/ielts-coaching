# Reads English aloud with the voices built into Windows (for dictation and listening practice).
# Speak one line of a file (the student doesn't see the text):
#   powershell -NoProfile -ExecutionPolicy Bypass -File tools/say.ps1 -File work/dictation/today.txt -Line 1
# Speak some text directly:
#   powershell -NoProfile -ExecutionPolicy Bypass -File tools/say.ps1 -Text "Hello"
# Options: -Rate -10..10 (default -1, a little slow), -Repeat 2 (say it twice)

param(
    [string]$File = "",
    [int]$Line = 0,
    [string]$Text = "",
    [int]$Rate = -1,
    [int]$Repeat = 1
)

Add-Type -AssemblyName System.Speech
$voice = New-Object System.Speech.Synthesis.SpeechSynthesizer

# Prefer a British English voice (closest to IELTS audio), then any English voice
$installed = $voice.GetInstalledVoices() | Where-Object { $_.Enabled } | ForEach-Object { $_.VoiceInfo }
$pick = $installed | Where-Object { $_.Culture.Name -eq "en-GB" } | Select-Object -First 1
if (-not $pick) { $pick = $installed | Where-Object { $_.Culture.Name -like "en-*" } | Select-Object -First 1 }
if ($pick) { $voice.SelectVoice($pick.Name) }
$voice.Rate = $Rate

if ($File -ne "") {
    $lines = @(Get-Content -Path $File -Encoding UTF8 | Where-Object { $_.Trim() -ne "" })
    if ($Line -ge 1 -and $Line -le $lines.Count) {
        $Text = $lines[$Line - 1]
    } elseif ($Line -eq 0) {
        $Text = $lines -join " . "
    } else {
        Write-Output "Line $Line not found (file has $($lines.Count) lines)."
        exit 1
    }
}

if ($Text -eq "") { Write-Output "Nothing to say."; exit 1 }

for ($i = 0; $i -lt $Repeat; $i++) {
    $voice.Speak($Text)
    if ($i -lt $Repeat - 1) { Start-Sleep -Milliseconds 1500 }
}
# Do not print the text: the student must not see it before typing.
Write-Output "Spoken (line $Line, voice: $($voice.Voice.Name))."

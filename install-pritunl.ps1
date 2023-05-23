$URL = "https://github.com/pritunl/pritunl-client-electron/releases/download/1.3.3484.2/Pritunl.exe"
$Output = "$env:USERPROFILE\Pritunl.exe"

# Check if the file already exists
if (Test-Path -Path $Output) {
    Write-Host "Pritunl executable already exists. Proceeding with installation..."
    $process = Start-Process -FilePath $Output -ArgumentList "/SILENT" -PassThru
    $process.WaitForExit()
} else {
    Write-Host "Downloading Pritunl executable..."
    $wc = New-Object System.Net.WebClient
    $wc.DownloadFile($URL, $Output)

    $processInfo = New-Object System.Diagnostics.ProcessStartInfo
    $processInfo.FileName = $Output
    $processInfo.Arguments = "/SILENT"
    $processInfo.WindowStyle = 'Hidden'

    $process = New-Object System.Diagnostics.Process
    $process.StartInfo = $processInfo
    $process.Start()
    $process.WaitForExit()
}

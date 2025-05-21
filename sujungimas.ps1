param (
    [string]$fileName
)
if (-Not (Test-Path $fileName)) {
    Write-Host "Failas '$fileName' neegzistuoja."
    exit 1
}

$lines = Get-Content $fileName

$mergedLines = @()

for ($i = 0; $i -lt $lines.Length; $i += 2) {
    if ($i + 1 -lt $lines.Length) {
        $mergedLine = $lines[$i] + $lines[$i + 1]
    } else {
        $mergedLine = $lines[$i]
    }

    $mergedLines += $mergedLine

    Write-Host "Sujungtos eilutes ilgis: $($mergedLine.Length)"
}

Write-Host "Sujungtos eilutes:" $mergedLines | ForEach-Object { Write-Host $_ }

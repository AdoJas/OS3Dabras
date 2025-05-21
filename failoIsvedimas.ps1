param (
    [string]$file,
    [int]$start,
    [int]$end
)

if (-Not (Test-Path $file)) {
    Write-Host "Failas nerastas!"
    exit 1
}

$lines = Get-Content $file

if ($start -lt 1 -or $end -gt $lines.Count -or $start -gt $end) {
    Write-Host "Netinkamas eilučių intervalas."
    exit 1
}

$lines[($start-1)..($end-1)]
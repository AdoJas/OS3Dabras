param (
    [string]$word
)

$files = Get-ChildItem -File

foreach ($file in $files) {
    try {
        $content = Get-Content $file.FullName -Raw

        if ($content -like "*$word*") {
            Remove-Item $file.FullName
            Write-Host "Ištrintas failas: $($file.Name)"
        }
    } catch {
        Write-Host "Nepavyko atidaryti failo: $($file.Name)"
    }
}
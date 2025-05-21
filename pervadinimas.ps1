param (
    [string[]]$failai
)

foreach ($failas in $failai) {
    if (Test-Path $failas) {
        $uppercaseFailas = $failas.ToUpper()
        
        if (-Not (Test-Path $uppercaseFailas)) {
            $tempFailas = "$failas.temp"  

            Move-Item $failas $tempFailas
            Move-Item $tempFailas $uppercaseFailas
            Write-Host "Failas pervadintas: $failas -> $uppercaseFailas"
        } else {
            Write-Host "Pervardinti nepavyko, nes failas '$uppercaseFailas' jau egzistuoja."
        }
    } else {
        Write-Host "Failas '$failas' neegzistuoja."
    }
}

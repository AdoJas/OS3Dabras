param (
    [string]$kelias
)

if (Test-Path $kelias -PathType Container) {
    Write-Host "Tai yra direktorija"
} 

elseif (Test-Path $kelias -PathType Leaf) {
    Write-Host "Tai yra failas"
} 

else {
    Write-Host "Tai kazkas kito"
}
# Get the current username
$username = (whoami).Split('\')[-1]

# Get all logon sessions (interactive logons)
$sessions = Get-CimInstance Win32_LogonSession | Where-Object { $_.LogonType -eq 2 }

foreach ($session in $sessions) {
    $assoc = Get-CimAssociatedInstance -InputObject $session -Association Win32_LoggedOnUser

    foreach ($user in $assoc) {
        if ($user.Antecedent.Name -eq $username) {
            $loginTime = $session.StartTime
            $loginDateTime = [datetime]::ParseExact($loginTime, "yyyyMMddHHmmss.000000-000", $null)

            $now = Get-Date
            $duration = $now - $loginDateTime

            Write-Host "Vartotojas '$username' dirba jau: $($duration.Hours) val. $($duration.Minutes) min. $($duration.Seconds) sek."
            exit 0
        }
    }
}

Write-Host "Nepavyko rasti naudotojo informacijos."

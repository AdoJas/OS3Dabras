$filename = "3uzduotis.txt"

Get-Content $filename | ForEach-Object {
    # Split the line into words
    $words = $_ -split '\s+'

    if ($words.Length -ge 2) {
        $words[0], $words[1] = $words[1], $words[0]
    }

    $words -join ' '
}
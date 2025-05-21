if [ $# -eq 0 ]; then
    echo "Klaida: Nepateiktas failo pavadinimas." >&2
    exit 1
fi

filename="$1"

if [ ! -f "$filename" ]; then
    echo "Klaida: Failas '$filename' neegzistuoja." >&2
    exit 1
fi

if file "$filename" | grep -q "with CRLF line terminators"; then
    echo "Windows stiliaus eiluciu pabaiga. Tvarkome..."
    sed -i 's/\r//' "$filename"
fi

awk 'NR % 2 == 1 {str = $0} NR % 2 == 0 {print str $0; print length(str $0)}' "$filename"


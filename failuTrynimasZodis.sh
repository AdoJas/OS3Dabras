if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <directory> <word>"
    exit 1
fi

DIRECTORY=$1
WORD=$2

if [ ! -d "$DIRECTORY" ]; then
    echo "Error: Direktorija '$DIRECTORY' neegzistuoja."
    exit 2
fi

for file in "$DIRECTORY"/*; do
    if [ -f "$file" ] && grep -q "$WORD" "$file"; then
        echo "Trinamas failas: $file"
        rm "$file"
    fi
done


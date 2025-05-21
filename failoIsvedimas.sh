if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <file> <start_line> <end_line>"
    exit 1
fi

FILE=$1
START_LINE=$2
END_LINE=$3

if [ ! -f "$FILE" ]; then
    echo "Error: Failas '$FILE' neegzistuoja."
    exit 2
fi

sed -n "${START_LINE},${END_LINE}p" "$FILE"


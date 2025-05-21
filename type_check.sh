if [ -z "$1" ]; then
    echo "Usage: $0 <path>"
    exit 1
fi

if [ -f "$1" ]; then
    echo "$1 yra failas."
elif [ -d "$1" ]; then
    echo "$1 yra direktorija."
else
    echo "$1 yra kazkas kito."
fi

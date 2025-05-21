if [ -z "$1" ]; then
    echo "Usage: $0 <username>"
    exit 1
fi

USER=$1

login_time=$(w -h | grep "^$USER" | awk '{print $4}')

if [ -z "$login_time" ]; then
    echo "User $USER is not logged in."
    exit 1
fi

current_time=$(date "+%Y-%m-%d %H:%M:%S")
login_timestamp=$(date -d "$login_time" "+%s")
current_timestamp=$(date -d "$current_time" "+%s")

time_diff=$((current_timestamp - login_timestamp))

hours=$((time_diff / 3600))
minutes=$(((time_diff % 3600) / 60))
seconds=$((time_diff % 60))

echo "Naudotojas $USER yra prisijunges $hours valandu, $minutes minutes ir $seconds sekundes."


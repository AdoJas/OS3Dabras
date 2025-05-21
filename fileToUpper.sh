if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <file1> <file2> [<file3> ...]"
    exit 1
fi

for file in "$@"; do
    if [ -e "$file" ]; then  
        upper_name=$(echo "$file" | tr 'a-z' 'A-Z')  

        if [ -e "$upper_name" ]; then 
            echo "$upper_name jau egzistuoja, nepavyko pervadinti."  
        else
            mv "$file" "${file}.temp"  
            mv "${file}.temp" "$upper_name"  
            echo "$file pervadintas į $upper_name"  
        fi
    else
        echo "Failas $file neegzistuoja." 
    fi
done


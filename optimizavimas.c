#!/bin/bash

echo "Iveskite failo varda"

read failas

if [ ! -f "$failas" ]; then
    echo "Failas '$failas' neegzistuoja."
    exit 1
fi

awk '
{
    if (NR % 2 == 1) {
        eilute = $0
    } 
	else {
        eilute = eilute " " $0
        ilgis = length(eilute)
        print eilute
        print "Ilgis: " ilgis
    }
}
END {
    if (eilute != "") {
        ilgis = length(eilute)
        print eilute
        print "Ilgis: " ilgis
    }
' "$failas"
}
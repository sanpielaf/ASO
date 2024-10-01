#!/bin/bash

output_file="archivos_peligrosos.txt"

find / -type f -perm -o=w -exec ls -l {} \; 2>/dev/null | grep "^-...rw.rw." > "$output_file"

echo "La lista de archivos peligrosos ha sido guardada en $output_file"

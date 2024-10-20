#Ejercicio 14. Realizar un script gestionusuarios.sh que permita dar de alta y de baja a usuario del sistema GNU/Linux 
#indicados como argumento: ./gestionusuarios.sh alta/baja nombre apellido1 apellido2 [grupo]

#En el caso de que se le pase la opción alta: El script asignará al usuario un identificativo para el sistema con el formato 
#aluXXYYZ donde XX son las dos primeras letras del apellido1, YY son las dos primeras letras del apellido2 y Z es la inicial del nombre. 
#En caso de no indicar el grupo al que pertenece, se creará un nuevo grupo con el mismo identificativo que el usuario.
#En el caso de que se le pase la opción baja: El programa debe calcular la identificación del usuario, 
#igual que se indica en el menú anterior, y proceder a dar de baja la cuenta.
#En otro caso. Indicar “Error. La sintaxis correcta es ./gestionusuarios.sh alta/baja nombre apellido1 apellido2 [grupo]”

#!/bin/bash

estado=$1
nombre=$2
apellido1=$3
apellido2=$4
grupo=$5

xx=${apellido1:0:2} 
yy=${apellido2:0:2}
z=${nombre:0:1}

nombre_usuario="al${xx}${yy}${z}"

if [[ "$estado" = "alta" && -z  $grupo ]]; then 
sudo useradd "$nombre_usuario" && sudo usermod -a -G "$nombre_usuario" "$nombre_usuario"

elif [[ "$estado" = "alta" ]]; then
sudo useradd "$nombre_usuario" && sudo usermod -a -G "$grupo" "$nombre_usuario"  

elif [[ "$estado" = "baja" ]]; then
sudo userdel "$nombre_usuario"

else

echo "“Error. La sintaxis correcta es ./gestionusuarios.sh alta/baja nombre apellido1 apellido2 [grupo]” " 

fi

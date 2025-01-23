#!/bin/bash

#Colores
B2="\033[1;3;37m"
R="\033[1;31m"
RT="\033[0m"

#Valida si el archivo .bash_history existe
if [ ! -f "$HOME/.bash_history" ]; then
    echo -e "${R}No existe el archivo ${B2}~/.bash_history${RT}"
    echo -e "${B2}Por favor lea el manual ejecutando: ${R}\"-h,  --help\"${RT}"
    echo -e "${R}Saliendo...${RT}"
    sleep 1
    exit 0
fi

#Crea el archivo de registro y usa su ruta
touch "$HOME/.registro_cmd.log"
ruta_log="$HOME/.registro_cmd.log"

#Variable de los días
dia_actual=$(date +"%d/%m")
tiempo_actual=$(date +"%H:%M")

#Toda la lógica para guardar los comandos ejecutados de manera organizada
if ! grep -q "========== Registro de comandos ==========" "$ruta_log"; then
    echo "========== Registro de comandos ==========" > $ruta_log
fi

history -a

ultimo_comando=$(tail -n 10 ~/.bash_history | nl -w 3 -s "-   ")

echo "[$tiempo_actual]" "[$dia_actual]"  >> $ruta_log
echo "$ultimo_comando" >> $ruta_log
echo "------------------------------------------" >> $ruta_log
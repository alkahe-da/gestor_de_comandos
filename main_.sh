#!/bin/bash
clear
#Colores
B="\033[1;37m"
B2="\033[1;3;37m"
R="\033[1;31m"
R2="\033[1;3;31m"
V="\033[1;32m"
M="\033[1;3;5;35m"
RT="\033[0m"

function que_hace_esta_app(){
 echo -e "${M}Registro de Comandos x ANKHAL${RT}"
 echo -e "${B}Este script facilita la visibilidad y reutilización de comandos ejecutados, ayudando en seguridad y practicidad.${RT}"
 echo ""  
 echo -e "${R2}Es esencial contar con el archivo ${B}.bash_history${RT} en ${B2}\$HOME${RT}. ${B}Para configurarlo:${RT}"  
 echo -e "1. ${B2}touch ~/.bash_history${RT}"  
 echo -e "2. ${B2}Añade export HISTFILE=~/.bash_history en ~/.bashrc${RT}"  
 echo -e "\n${V}¿Cómo usar?${RT}"  
 echo -e "${B}Ejecuta main_.sh para visualizar y seleccionar comandos recientes de forma interactiva.${RT}"  
 echo -e "\n${V}Recomendaciones:${RT}"  
 echo -e "${B2}Automatízalo desde ~/.bashrc o usando cron para mayor comodidad.${RT}"  
 echo -e "\n${M}Con cariño, ANKHAL.${RT}"
 echo ""
 echo -e "   ${B2}\"-h\"   \"--help\"    Muestra este mensaje  /  Leer \"README\" para más info${RT}"	
}

#Acciona el parámetro "-h, --help", para ayuda con el código
if [[ "$1"  == "-h" || "$1" == "--help" ]]; then
	que_hace_esta_app
	exit 0
fi

#Se llaman las variables del script padre y se ejecuta.
eval "$(find -iname "registro_cmd_.sh" -type f -exec cat {} \;)"

#Todo el menú
echo -e "========== ${B2}Registro de comandos${RT} =========="
echo "$ultimo_comando"
echo "=========================================="

while true; do
echo ""
echo -e -n "${B2}Por favor ingresa el ${R2}# ${B2}del comando: ${RT}"
read entrada

#Se valida la entrada del usuario
if [[ "$entrada" == "exit" || "$entrada" == "Exit" || "$entrada" == "salir" || "$entrada" == "SALIR" ]]; then
    echo -e "${R2}Saliendo...${RT}"
    sleep 1
    exit 0
elif [[ ! $entrada =~ ^[0-9]$|10$ ]]; then
    echo -e "${R}ERROR${RT}: Por favor ingresa un carácter válido."
else
    break
fi
done

#La lógica para ejecutar el comando elegido en el historial.
comando_elegido=$(echo "$ultimo_comando" | grep "^ *$entrada-" | sed 's/^ *[0-9]*-   //')
echo ""
echo -e -n "Deseas ejecutar el comando ${B2}\"$comando_elegido\" ${RT}? (${V}s${RT}/${R}n${RT}) "
read ejecucion
if [[ "$ejecucion" =~ ^[sS]$ || -z "$ejecucion" ]]; then
    eval "$comando_elegido"
    echo ""
    exec bash
else
    echo -e "${R2}Saliendo...${RT}"
    sleep 1
fi
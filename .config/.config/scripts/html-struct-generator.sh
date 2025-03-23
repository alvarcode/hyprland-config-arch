#!/bin/bash
filename=""

if [ $# -eq 0 ]; then
	echo "No se proporcionó algún argumento que represente el archivo destino"
	exit 1
fi

if [ $# -gt 1 ]; then
	echo "Solo debe pasar un argumento"
	exit 1
fi

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
	echo -e "Un comando para generar una plantilla con la estructura HTML básica en un archivo especificado.\n"
	echo -e "Uso: $0 FILENAME [OPTION]\n"
	echo -e "FILENAME   Ruta del archivo HTML a modificar\n"
	echo -e "OPTION\n  -h, --help\t  Imprime esta ayuda"
	exit
else
	filename="$1"
fi

if [ ! -f "$filename" ]; then
	echo "El archivo no existe"
	exit 1
elif [ ${filename:-5} != ".html" ]; then
	echo "El archivo '$filename' no es un archivo HTML"
	exit 1
fi
	
cp ./templates/basic-struct.html "$filename"
echo "󰗠 Plantilla aplicada correctamente!"


#!/bin/bash
#Autor: d4sh&r
#Ejecuta el comando host en el rango del dominio especificado
#esto es util para obtener subdominios, aunque hay que recordar
#que el comando host es DNS lookup utility
if test -z $1; then
	echo "bash h0st.sh <ej. domain.com>";
	exit
fi

echo $1
ip=$(host $1 | cut -d " " -f 4 | head -n 1)
echo $ip

if test -z $ip; then
	echo "No se pudo obtener la IP del dominio";
	exit
fi

rango=$(echo $ip | cut -d "." -f 1,2,3)
domain=(echo $1)

printf "\n[+] Ejecutando comando Host en rango $rango.1-254\n\n"

for ip in {1..254};do
	cmd=$(echo -n "$rango.$ip ";host $rango.$ip)
	echo $cmd | grep "$nombre"| cut -d " " -f 1,6
done
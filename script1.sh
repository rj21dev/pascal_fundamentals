#!/bin/bash

# Скрипт принимает ровно два аргумента, которые должны быть целыми числами
# Скрипт выдает ARG2 натуральных чисел, начиная с числа ARG1
# Числа печатаются через пробел. В конце перевод строки

if [ $# -ne 2 ]
then
	echo "Error: $0 [integer] [ingeger]" 
	exit 1	
fi
if [[ $1 =~ ^[0-9]+$ ]]
then
	:
else
	echo "Error: \"$1\" not integer" 
	exit 1
fi
if [[ $2 =~ ^[0-9]+$ ]]
then
	:
else
	echo "Error: \"$2\" not integer" 
	exit 1
fi
BEGIN=$1
END=$(( $1 + $2 ))
while [ $BEGIN -lt $END ]
do
	echo -n "$BEGIN "
	BEGIN=$(( BEGIN + 1 ))
done
echo

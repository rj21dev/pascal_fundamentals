#!/bin/bash

# Этот скрипт печатает столько символов "@", сколько файлов в текущем каталоге

VAR=$(ls -p | grep -v / | wc -l )
I=0
while [ $I -lt $VAR ]
do
	echo @
	I=$(( I + 1 ))
done

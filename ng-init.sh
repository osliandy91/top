#!/usr/bin/env bash

npm_install="npm install"

echo "Ejecutando -> {$npm_install}"
if ! $npm_install
then
    echo "Error: no se puede ejecutar {$npm_install}, no se puede continuar"
    exit
fi

# para evitar el prompt de analitics
ng analytics off
echo "Iniciando servidor de prueba:"
ng serve --host 0.0.0.0 --disableHostCheck=true --ssl=true
#ng build --watch=true

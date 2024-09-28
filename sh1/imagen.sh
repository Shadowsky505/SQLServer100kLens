#!/bin/bash

# Variables
CONTAINER_NAME="happy_fermi"
SA_PASSWORD="yourStrong(!)Password"
PORT="1433"

docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=$SA_PASSWORD" -p $PORT:1433 -d --name $CONTAINER_NAME mcr.microsoft.com/mssql/server:2022-latest
if [ $? -ne 0 ]; then
    echo "Error al descargar y ejecutar la imagen de Docker."
    exit 1
fi

echo "Imagen de Docker descargada y ejecutada correctamente."

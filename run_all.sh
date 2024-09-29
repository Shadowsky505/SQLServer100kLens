#!/usr/bin/env bash


./download.sh
if [ $? -ne 0 ]; then
    echo "Error al descargar y preparar los archivos."
    exit 1
fi


./imagen.sh
if [ $? -ne 0 ]; then
    echo "Error al descargar y ejecutar la imagen de Docker."
    exit 1
fi


./sh1/copy_files.sh
if [ $? -ne 0 ]; then
    echo "Error al copiar los archivos CSV al contenedor."
    exit 1
fi


./sh1/setup_database.sh
if [ $? -ne 0 ]; then
    echo "Error al crear la base de datos y las tablas."
    exit 1
fi

./sh1/load_data.sh
if [ $? -ne 0 ]; then
    echo "Error al cargar los datos en las tablas."
    exit 1
fi

echo "Todos los scripts se ejecutaron correctamente."

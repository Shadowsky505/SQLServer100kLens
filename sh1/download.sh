#!/bin/bash

# Variables
SOURCE_DIR="/home/lucas/ml-100k"  
ZIP_URL="https://files.grouplens.org/datasets/movielens/ml-100k.zip"
ZIP_FILE="ml-100k.zip"


curl -o $ZIP_FILE $ZIP_URL
if [ $? -ne 0 ]; then
    echo "Error al descargar el archivo ZIP."
    exit 1
fi


unzip $ZIP_FILE -d $SOURCE_DIR
if [ $? -ne 0 ]; then
    echo "Error al descomprimir el archivo ZIP."
    exit 1
fi


cd $SOURCE_DIR/ml-100k

# Crear u_item.csv
echo "movie_id,movie_title,release_date,video_release_date,IMDb_URL,unknown,Action,Adventure,Animation,Children,Comedy,Crime,Documentary,Drama,Fantasy,Film-Noir,Horror,Musical,Mystery,Romance,Sci-Fi,Thriller,War,Western" > ../u_item.csv
awk 'BEGIN {FS="|"; OFS=","} {print $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23, $24}' u.item >> ../u_item.csv

# Crear u_data.csv
echo "user_id,item_id,rating,timestamp" > ../u_data.csv
awk 'BEGIN {FS="\t"; OFS=","} {print $1, $2, $3, $4}' u.data >> ../u_data.csv

# Crear u_user.csv
echo "user_id,age,gender,occupation,zip_code" > ../u_user.csv
awk 'BEGIN {FS="\t"; OFS=","} {print $1, $2, $3, $4, $5}' u.user >> ../u_user.csv


cd -

echo "Archivos CSV preparados correctamente."


curl -o ml-100k.zip https://files.grouplens.org/datasets/movielens/ml-100k.zip

unzip ml-100k.zip

cd ml-100k

# Crear u_item.csv
echo "movie_id,movie_title,release_date,video_release_date,IMDb_URL,unknown,Action,Adventure,Animation,Children,Comedy,Crime,Documentary,Drama,Fantasy,Film-Noir,Horror,Musical,Mystery,Romance,Sci-Fi,Thriller,War,Western" > ../u_item.csv
awk 'BEGIN {FS="|"; OFS=","} {print $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23, $24}' u.item >> ../u_item.csv

# Crear u_data.csv
echo "user_id,item_id,rating,timestamp" > ../rating.csv
awk 'BEGIN {FS="\t"; OFS=","} {print $1, $2, $3, $4}' u.data >> ../rating.csv

# Crear u_user.csv
echo "user_id,age,gender,occupation,zip_code" > ../users.csv
awk 'BEGIN {FS="|"; OFS=","} {print $1, $2, $3, $4, $5}' u.user >> ../users.csv


cd ..

echo "Archivos CSV preparados correctamente."

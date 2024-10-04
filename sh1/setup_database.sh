CONTAINER_NAME="sql1"
SERVER="localhost"
USER="SA"
PASSWORD="Contrastrasena(2024)"
DATABASE="votos"
SQLCMD_PATH="/opt/mssql-tools18/bin/sqlcmd"  

docker exec -i $CONTAINER_NAME /bin/bash -c "
$SQLCMD_PATH -S $SERVER -U $USER -P '$PASSWORD' -N -C -Q \"\
IF EXISTS (SELECT * FROM sys.databases WHERE name = '$DATABASE')
BEGIN
    DROP DATABASE [$DATABASE];d
END;
GO

CREATE DATABASE [$DATABASE];
GO
USE [$DATABASE];
GO

CREATE TABLE u_data (
    user_id INT,
    item_id INT,
    rating INT,
    timestamp BIGINT
);
GO

CREATE TABLE u_item (
    movie_id INT,
    movie_title VARCHAR(255),
    release_date VARCHAR(255),
    video_release_date VARCHAR(255),
    IMDb_URL VARCHAR(255),
    unknown INT,
    Action INT,
    Adventure INT,
    Animation INT,
    Children INT,
    Comedy INT,
    Crime INT,
    Documentary INT,
    Drama INT,
    Fantasy INT,
    Film_Noir INT,
    Horror INT,
    Musical INT,
    Mystery INT,
    Romance INT,
    Sci_Fi INT,
    Thriller INT,
    War INT,
    Western INT
);
GO

CREATE TABLE u_user (
    user_id INT,
    age INT,
    gender VARCHAR(10),
    occupation VARCHAR(50),
    zip_code VARCHAR(10)
);
GO
\""

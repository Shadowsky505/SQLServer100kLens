CONTAINER_NAME="sql1"
SA_PASSWORD="Contrastrasena(2024)"
PORT="1433"

docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=$SA_PASSWORD" -p $PORT:1433 -d --name $CONTAINER_NAME mcr.microsoft.com/mssql/server:2022-latest

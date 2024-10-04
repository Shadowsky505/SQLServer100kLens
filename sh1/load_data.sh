CONTAINER_NAME="sql1"
SERVER="localhost"
USER="SA"
PASSWORD="Contrastrasena(2024)"
DATABASE="votos"
TARGET_DIR="/lib"
SQLCMD_PATH="/opt/mssql-tools18/bin/sqlcmd"

docker exec -i $CONTAINER_NAME /bin/bash -c "
$SQLCMD_PATH -S $SERVER -U $USER -P '$PASSWORD' -N -C -Q \"
USE $DATABASE;
GO

BULK INSERT u_data
FROM '$TARGET_DIR/u_data.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\\n',
    FIRSTROW = 2
);
GO

BULK INSERT u_item
FROM '$TARGET_DIR/u_item.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\\n',
    FIRSTROW = 2
);
GO

BULK INSERT u_user
FROM '$TARGET_DIR/u_user.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\\n',
    FIRSTROW = 2
);
GO
\""

CONTAINER_NAME="sql1"
TARGET_DIR="/lib"

docker cp rating.csv "$CONTAINER_NAME:$TARGET_DIR/u_data.csv"
docker cp u_item.csv "$CONTAINER_NAME:$TARGET_DIR/u_item.csv"
docker cp users.csv "$CONTAINER_NAME:$TARGET_DIR/u_user.csv"

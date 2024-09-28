#!/bin/bash

# Variables
CONTAINER_NAME="happy_fermi"
SOURCE_DIR="/home/lucas/ml-100k"  
TARGET_DIR="/lib"

docker cp "$SOURCE_DIR/u_data.csv" "$CONTAINER_NAME:$TARGET_DIR/u_data.csv"
docker cp "$SOURCE_DIR/u_item.csv" "$CONTAINER_NAME:$TARGET_DIR/u_item.csv"
docker cp "$SOURCE_DIR/u_user.csv" "$CONTAINER_NAME:$TARGET_DIR/u_user.csv"

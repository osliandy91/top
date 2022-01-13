#!/usr/bin/env bash

NODE_VERSION="latest"
ANGULAR_8_VERSION="8.3.26"
ANGULAR_9_VERSION="9"
TAG_8="$NODE_VERSION-$ANGULAR_8_VERSION"
TAG_9="$NODE_VERSION-$ANGULAR_9_VERSION"
REPO_NAME="notideh/node-angular"

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

echo "Ejecutando en: $DIR"
cd "$DIR" || { echo "No existe el directorio: $DIR"; exit 1; }

# Angular 8
BUILD_COMMAND="docker build --rm -t $REPO_NAME:$TAG_8 --build-arg NODE_VERSION=$NODE_VERSION --build-arg ANGULAR_VERSION=$ANGULAR_8_VERSION ."
echo "Construyendo la imagen $REPO_NAME:$TAG_8: > $BUILD_COMMAND"
if ! $BUILD_COMMAND
then
    echo "Error ejecutando: $BUILD_COMMAND"
    exit 1
fi

PUSH_COMMAND="docker push $REPO_NAME:$TAG_8"
echo "Subiendo a Docker la imagen $REPO_NAME:$TAG_8: > $PUSH_COMMAND"
if ! $PUSH_COMMAND
then
    echo "Error ejecutando: $PUSH_COMMAND"
    exit 1
fi

# Angular 9
BUILD_COMMAND="docker build --rm -t $REPO_NAME:$TAG_9 --build-arg NODE_VERSION=$NODE_VERSION --build-arg ANGULAR_VERSION=$ANGULAR_9_VERSION ."
echo "Construyendo la imagen $REPO_NAME:$TAG_9: > $BUILD_COMMAND"
if ! $BUILD_COMMAND
then
    echo "Error ejecutando: $BUILD_COMMAND"
    exit 1
fi

PUSH_COMMAND="docker push $REPO_NAME:$TAG_9"
echo "Subiendo a Docker la imagen $REPO_NAME:$TAG_9: > $PUSH_COMMAND"
if ! $PUSH_COMMAND
then
    echo "Error ejecutando: $PUSH_COMMAND"
    exit 1
fi

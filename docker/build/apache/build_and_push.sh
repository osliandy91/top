#!/usr/bin/env bash

APACHE_VERSION="latest"
TAG="$APACHE_VERSION"
REPO_NAME="notideh/apache"

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

echo "Ejecutando en: $DIR"
cd "$DIR" || { echo "No existe el directorio: $DIR"; exit 1; }

echo "Construyendo la imagen $REPO_NAME:$TAG: > docker build --rm -t $REPO_NAME:$TAG --build-arg APACHE_VERSION=$APACHE_VERSION ."
docker build --rm -t "$REPO_NAME:$TAG" --build-arg APACHE_VERSION="$APACHE_VERSION" .

echo "Subiendo a Docker la imagen $REPO_NAME:$TAG: > docker push $REPO_NAME:$TAG"
docker push "$REPO_NAME:$TAG"

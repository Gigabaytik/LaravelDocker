#!/bin/sh

DIR_NAME='src'
DIR="./$DIR_NAME"
if [ -d "$DIR" ]; then
    echo "found $DIR_NAME dir"

    rm -rf $DIR
    echo "removed src $DIR_NAME"
fi

SOURCE="git@github.com:laravel/laravel.git"
git clone $SOURCE $DIR_NAME

touch "$DIR/.gitkeep"
echo ".gitkeep has been restored"

ENV_FILENAME='.env'
ENV_EXAMPLE_FILENAME="$ENV_FILENAME.example"
cp "$DIR/$ENV_EXAMPLE_FILENAME" "$DIR/$ENV_FILENAME"
echo "copied $ENV_FILENAME from $ENV_EXAMPLE_FILENAME"

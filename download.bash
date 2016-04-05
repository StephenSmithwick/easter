#! /bin/bash

echo "Downloading Easter Project:"

GIST=59cb017eeedc9396cd94 VERSION=HEAD

wget -qO- https://gist.github.com/StephenSmithwick/$GIST/archive/$VERSION.zip | bsdtar -xvf- 

mkdir -p $HOME/easter
mv $GIST-$VERSION/* $HOME/easter
rm -r $GIST-$VERSION

bash $HOME/easter/install.bash
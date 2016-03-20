Install
```
GIST=59cb017eeedc9396cd94 VERSION=HEAD; wget -qO- https://gist.github.com/StephenSmithwick/$GIST/archive/$VERSION.zip | bsdtar -xvf-; mkdir -p $HOME/setup; mv $GIST-$VERSION/* $HOME/setup; rm -r $GIST-$VERSION; bash $HOME/install/setup.bash
```
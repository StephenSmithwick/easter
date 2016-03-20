Install
```
GIST=59cb017eeedc9396cd94 VERSION=27e0289980b884d6beba46b8270b3ca30996d29c; wget -qO- https://gist.github.com/StephenSmithwick/$GIST/archive/$VERSION.zip | bsdtar -xvf-; mkdir -p $HOME/setup; mv $GIST-$VERSION/* $HOME/setup; rm -r $GIST-$VERSION
```
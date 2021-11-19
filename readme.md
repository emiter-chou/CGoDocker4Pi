# Cross Compiler for Go in Pi Env with C lib

## Purpose:
To build a cross compile environment for go on macOS. You may no need do this on Linux or Windows.
It can replace the from image to any other language you would like to use like Rust?

## How to use:
1. Edit the Dockerfile to your desired Golang version, then...
```shell
docker build .
```

2. Start The Container:
```shell
docker run -v [Host path]:/go/src -ti --name mycgo mycgo:[version]
```

3. Enter the Container and build:
```shell
GOARCH=arm GOARM=7 CGO_ENABLED=1 CC=arm-linux-gnueabihf-gcc go build -o [Output File]
```
or just (If you have some other modules which are write by yourself, you have to mount all of them)
```shell
docker run --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp -e GOARCH=arm  -e GOARM=7 -e CGO_ENABLED=1 -e CC=arm-linux-gnueabihf-gcc mycgo:[version] go build -v
```
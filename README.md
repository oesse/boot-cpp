# boot-cpp

This repository provides a basic [cmake](http://cmake.org) based build
infrastructure for C++ projects with
[catch](https://github.com/catchorg/Catch2) as testing framework.

## usage

To start a new C++ project:

```sh
$ git clone http://github.com/oesse/boot-node.git <your new project directory>
$ cd <your new project directory>
$ git remote set-url origin <your git upstream>
$ git push
```

To build and run tests:
```sh
$ mkdir build && cd build
$ cmake [CMAKE OPTIONS] ..
$ ccmake .                  # optional to configure toolchain
$ cmake --build .
$ ctest 
```

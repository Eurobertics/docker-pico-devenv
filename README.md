# docker-pico-devenv
Rapsberry Pico Docker development enviroment, with the Pico SDK and the blink example. This repo provides the Dockerfiles as well as some sample code (blink example for Pico W).

The Image is based on the latest Debian image and is basically done by the following steps:

- Installed required software like `ARM GCC compiler, make, cmake, git, etc.`
- Get the latest Pico SDK from the [Raspberry Pico Github page](https://github.com/raspberrypi/pico-sdk).
- Initialising and fetching all Git submodules from the SDK.
- Set the `PICO_SDK_PATH` to the SDK path at `/opt/pico-sdk`
- Created a working directory at `/opt/pico`
- Copy the blink example to `/opt/blink_example`

The image can be used as follows:

If you want to compile your code directly within the container:
```
# docker run --rm -it /your/pico/project:/opt/pico eurobertics/pico-devenv:latest bash
```

Blink example usage:
```
# docker run --rm -it /your/pico/project:/opt/blink_example eurobertics/pico-devenv:latest bash
```
Then as stated in the examples:
```
# cd build
# cmake ..
# make
```

You can also use the image directly as a build image within [JetBrains CLion](https://www.jetbrains.com/clion/), or any other IDE which supports compiling and building with a Docker toolchain.

# Portcat

Alpine based Docker container with socat installed that can easily map multiple ports to another container

## Introduction

Changing the port mapping of an existing Docker container is not that easily done. After Googling around I found the suggestion
to use `socat` in a separate container which then will relay data transfers between the host and the target container.

Based on RobM's answer (see: [Exposing a port on a live Docker container](https://stackoverflow.com/a/42071577/1412607)) I have
created an Alpine based Docker container with `socat` installed which expects the name of the target container and the port mapping to enforce.
Along with a nifty Bash script I have made it easy to set it all up.

Enter Portcat! :)

## Installation (optional)

Run the following command:

    curl -sL https://raw.githubusercontent.com/archan937/portcat/master/script/install | sudo bash

This script will install the executable `portcat` to `/usr/local/bin/portcat`.

## Usage

### Using the executable

As portcat is a command-line-tool, for starters you can print its help instructions:

    PME-Legend ~> portcat -h
    Usage:

      portcat [OPTION] TARGET PORT [...PORT]

    Options:
      --daemon, [-d]
      --help, [-h]

    Run portcat container to proxy traffic

Pass both the name of the target container and the port mapping to enforce to `portcat`:

    portcat my-awesome-container 3456 4444:8080

That's it! The executable will create a container called `alpine-portcat` which relays the data transfers :)

Please note that you can run portcat as a daemon with `-d` or `--daemon`.

### Setup portcat manually

The example above is equivalent to the following commands:

    ipAddress=$(docker inspect my-awesome-container | grep IPAddress | grep -o '[0-9]\{1,3\}\(\.[0-9]\{1,3\}\)\{3\}' | head -n 1)
    docker run -p 3456:3456 -p 4444:4444 --name=alpine-portcat -it pmelegend/portcat:latest $ipAddress 3456 4444:8080

You can detach using Ctrl+P followed by Ctrl+Q.

## Contact me

For support, remarks and requests, please mail me at [pm_engel@icloud.com](mailto:pm_engel@icloud.com).

## License

Copyright (c) 2021 Paul Engel, released under the MIT license

[http://github.com/archan937](http://github.com/archan937) - [http://twitter.com/archan937](http://twitter.com/archan937) - [pm_engel@icloud.com](mailto:pm_engel@icloud.com)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

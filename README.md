docker-omd
==========

[Dockerfile](https://www.docker.com) for [Open Monitoring Distribution (OMD)](http://omdistro.org).

Run from Docker Hub
-------------------

A pre-built image is available on [Docker Hub](https://registry.hub.docker.com/u/fstab/omd) and can be run as follows:

    docker run -t -i fstab/omd

This will leave a shell open to access the container.

OMD will become available on [http://172.X.X.X/default](http://172.X.X.X/default).
The default login is `omdadmin` with password `omd`.
To find out the IP address, run `ip addr` in the container shell.

Build from Source
-----------------

The Docker image can be built as follows:

    git clone https://github.com/fstab/docker-omd
    cd docker-omd
    docker build -t="fstab/omd" .

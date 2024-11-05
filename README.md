PDS4 workshop tools in Docker
=============================

Build the container once:
```bash
docker build --tag pds4-workshop .
```

You can either enter the container shell directly to execute your commands in it:
```bash
docker run -it --rm -v "$(pwd):/data" pds4-workshop
```

__Note__: You may need to adjust the volume (`-v`) flag if you want to mount another folder to `/data` in the container. Here, the `$(pwd)` provide your current working directy. If you change it, you need to provide an explicit path.

You can also execute a command outside the container:
```bash
docker run -it --rm -v "$(pwd):/data" pds4-workshop validate --version
docker run -it --rm -v "$(pwd):/data" pds4-workshop lddtool --version
```

Note
----
- [OpenJDK Docker images](https://hub.docker.com/_/openjdk/) are depreciated, we use [AWS Corretto](https://hub.docker.com/_/amazoncorretto) instead.
- [PDS validate](https://github.com/NASA-PDS/validate) version: `3.6.0`
- [PDS LDD tool](https://github.com/NASA-PDS/pds4-information-model) version: `15.1.0`

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

> [!NOTE]
>  [OpenJDK Docker images](https://hub.docker.com/_/openjdk/) are depreciated, we use [AWS Corretto](https://hub.docker.com/_/amazoncorretto) instead.

> [!TIP]
> - Base image: Alpine version: `3.20`
> - Corretto openJDK version: `23.0`
> - [PDS validate](https://github.com/NASA-PDS/validate) version: `3.6.0`
> - [PDS LDD tool](https://github.com/NASA-PDS/pds4-information-model) version: `15.1.0`

Clone the hands-on sources
--------------------------
```bash
git clone https://s2e2.cosmos.esa.int/bitbucket/scm/psaas/pds4_workshop.git hands-on
```

or download directly the zip and unzip it:
```bash
wget https://s2e2.cosmos.esa.int/bitbucket/rest/api/latest/projects/PSAAS/repos/pds4_workshop/archive?format=zip
unzip pds4_workshop-master@xxxxxxx.zip
rm pds4_workshop-master@xxxxxxx.zip
mv pds4_workshop-master@xxxxxxx hands-on/
```

Go into the working folder and start the docker image:
```bash
cd hands-on/
docker run -it --rm -v "$(pwd):/data" pds4-workshop
```

Now you should be in the `/data` folder in docker and you can run the command of the hands-on session directly:
```
/data # validate --version
```

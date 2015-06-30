# Nightscout on Docker

**DEVELOPMENT VERSION! Use is without warranty or support. Review the LICENSE in the repository!**. Currently, Docker is not advised to be used outside the development environment.

All information, thought, and code described here is intended for informational and educational purposes only. Nightscout currently makes no attempt at HIPAA privacy compliance. Use of code from github.com is without warranty or support of any kind. Please review the LICENSE found within each repository for further details. Use Nightscout at your own risk, and do not use the information or code to make medical decisions.

## Nightscout on Docker 
This repository will contain all the configuration files for running Nightscout on a Docker environment. Docker enables the end-user to easily deploy and manage the Nightscout stack on top of a cloud-providers such as SoftLayer, Azure, Digital-Ocean, Amazon Web Services or a private server (Bring Your Own Node).

[![Docker Registry](http://dockeri.co/image/nightscout/cgm-remote-monitor-development)](https://registry.hub.docker.com/u/nightscout/cgm-remote-monitor-development/)

## Getting started using Docker

*Please note that the Docker resources are in beta phase, therefore it might contains some bugs. If you stumble across something, please create an issue in the Github issue-tracker so it can be resolved.*

### Deploying the stack using Tutum

An easy way to deploy and maintain your Docker environment is using Tutum. Tutum provides an user friendly interface for managing the Docker environment running on the cloud provider, which can either be [Amazon Web Services (AWS)](http://aws.amazon.com/), [Digital Ocean (DO)](https://www.digitalocean.com/), [SoftLayer](http://www.softlayer.com/) or [Microsoft Azure](http://azure.microsoft.com/). For this tutorial also provides steps to confugure [Amazone Web Services](cloudprovider/aws.md) and [Digital Ocean](cloudprovider/do.md) which are both quite easy to configure. You will require at least one of the services.

To stack configuration is written in a [Docker Compose](https://docs.docker.com/compose/) (which is the successor of [Fig](http://www.fig.sh/)) compatible language. Please do not forget to change the `API_SECRET` and the MongDB password in `MONGO_CONNECTION` and `MONGODB_PASS` in the environment variables.

Currently this deploys the [development branch of the project](https://github.com/fokko/cgm-remote-monitor) as it is not yet wired with the nightscout repository. But this will possibly fixed in the foreseeable future as a collaborator will configure it on the Nightscout repository. Every time a commit is pushed on the branch, the [Docker-hub](https://registry.hub.docker.com/u/fokkodriesprong/cgm-remote-monitor/) will build a new version of the image using a hook on the Github repository.

Hit the button to deploy the stack as defined in `docker-compose.yml`.

[![Deploy to Tutum](https://s.tutum.co/deploy-to-tutum.svg)](https://dashboard.tutum.co/stack/deploy/)

Deploying the stack might take some time as all the containers need to be pulled from the Docker repository. As Nightscout is dependent on the broker and database, these containers will boot first. Personally, I found out that if you use a host with very limited resources, for instance the `m1.micro` from AWS) the booting-process will time out depending on the available resources.

![Booting](http://i1126.photobucket.com/albums/l605/Knorfski/done.jpg)

Wait until everything is up and running. Now we can click on one of the containers to inspect. We can that Nightscout is booted and running. Possible errors should also pop up here in the log which might be usefull for debugging:

![Booting](http://i1126.photobucket.com/albums/l605/Knorfski/running_1.jpg)

When we go to services and inspect the endpoints we find the path to the machine:

![Booting](http://i1126.photobucket.com/albums/l605/Knorfski/services.jpg)

When we follow the URL we get the Nightscout interface:

![Booting](http://i1126.photobucket.com/albums/l605/Knorfski/nightscout.jpg)

If you have any idea's, don't hesitate to contact me.

### Deploying the stack using Docker compose.

To stack configuration is written in a [Docker Compose](https://docs.docker.com/compose/) (which is the successor of [Fig](http://www.fig.sh/)). Deploying is quick and easy:

```bash
git clone https://github.com/nightscout/nightscout-docker.git
cd nightscout-docker
docker-compose up
```

All images will be pulled from the registry and started by Docker.
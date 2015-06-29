# Getting started using Docker

** CURRENTLY NOT WORKING, PLEASE DO NOT FOLLOW THE GUIDE **

*Please note that the Docker-deployment is in beta phase, therefore it might contains some issues. If you stumble across something, please create an issue so it can be resolved.*

This tutorial is meant for people who are not familiar with Docker and will provide a guide to deploy the system and get it up and running.

## Deploying the stack using Tutum

An easy way to deploy and maintain your Docker environment is using Tutum. Tutum provides an interface on top of the cloud provider, which can be Amazon Web Services (AWS), Digital Ocean, SoftLayer or Microsoft Azure. For this tutorial we will use AWS and Digital Ocean which are both quite easy to configure. You will require at most one of the services.


To stack configuration is written in [Docker Compose](https://docs.docker.com/compose/) (which is the successor of Fig). You have to change the secret to something else.

```
nightscout:
  image: fokkodriesprong/cgm-remote-monitor:latest
  links:
   - database
   - broker
  ports:
   - "80"
  environment:
   - MONGO_CONNECTION=mongodb://database/nightscout
   - API_SECRET=NynkeMafkees
   - MQTT_MONITOR=mqtt://broker
   - PORT=80
database:
  image: mongo:3.0.3
broker:
  image: prologic/mosquitto
  ports:
   - "1883"
```

Currently this deploys the [master branch of my fork of the project](https://github.com/nightscout/cgm-remote-monitor) as it is not yet wired with the nightscout repository. But this will possibly fixed in the foreseeable future as a collaborator will configure it on the Nightscout repository. Every time a commit is done on the master-branch, the [Docker-hub](https://registry.hub.docker.com/u/fokkodriesprong/cgm-remote-monitor/) will build a new version of the image using a hook.

![Booting](http://i1126.photobucket.com/albums/l605/Knorfski/createanddeploy.jpg)

We have to provide a name for the stack and have to paste the stack code into the textarea. Next we create and deploy the stack.

![Booting](http://i1126.photobucket.com/albums/l605/Knorfski/running.jpg)

Deploying the stack might take some time as all the containers need to be downloaded. As Nightscout is dependent on the broker and database, these containers will boot first. Sometimes the booting-process will time out depending on the available resources (if you use for instance the m1.micro from AWS).

![Booting](http://i1126.photobucket.com/albums/l605/Knorfski/done.jpg)

Wait until everything is running. Then we can click on one of the containers to inspect it. We can observe that Nightscout is booted and running. Possible errors should also pop up here in the log:

![Booting](http://i1126.photobucket.com/albums/l605/Knorfski/running_1.jpg)

When we go to services and inspect the endpoints we find the path to the machine:

![Booting](http://i1126.photobucket.com/albums/l605/Knorfski/services.jpg)

When we follow the URL we get the Nightscout interface:

![Booting](http://i1126.photobucket.com/albums/l605/Knorfski/nightscout.jpg)
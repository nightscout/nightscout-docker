# Getting started using Docker

** CURRENTLY NOT WORKING, PLEASE DO NOT FOLLOW THE GUIDE **

*Please note that the Docker-deployment is in beta phase, therefore it might contains some issues. If you stumble across something, please create an issue so it can be resolved.*

This tutorial is meant for people who are not familiar with Docker and will provide a guide to deploy the system and get it up and running.

## Cloud provider

An easy way to deploy and maintain your Docker environment is using Tutum. Tutum provides an interface on top of the cloud provider, which can be Amazon Web Services (AWS), Digital Ocean, SoftLayer or Microsoft Azure. For this tutorial we will use AWS and Digital Ocean which are both quite easy to configure. You will require at most one of the services.

### Amazon Web Services (AWS)

First, create an account at [Amazon](http://aws.amazon.com/). Next we have to create a key which enables Tutum to create and manage virtual machines at AWS. This is done at the [AWS Identity and Access Management console](https://console.aws.amazon.com/iam/home?#users).

We create a new user:

![Create new user](http://i1126.photobucket.com/albums/l605/Knorfski/createnewgroup.jpg)

We have to assign a name, which can be arbitrary and is solely as a reference:

![Assign name](http://i1126.photobucket.com/albums/l605/Knorfski/createnewusername.jpg)

We get the key and we have to save them as we need them later. Please keep in mind that you should never share these keys with unknown parties as they will provide full access over the AWS account and all the use will be charged on your credit card.

![Got key](http://i1126.photobucket.com/albums/l605/Knorfski/createnewuserdone.jpg)

Next we have to go back to the user-screen by the `Close` button, we see one user which is the one we've just created:

![Got key](http://i1126.photobucket.com/albums/l605/Knorfski/screencapture-console-aws-amazon-com-iam-home-1434721897333.png)

We click on the user to attach a policy:

![Got key](http://i1126.photobucket.com/albums/l605/Knorfski/policy.jpg)

Personally I am using the `AmazonEC2FullAccess` which provides sufficient rights:

![Got key](http://i1126.photobucket.com/albums/l605/Knorfski/attachepolicy.jpg)

After clicking on Attache policy, we are done at AWS.

Next step is to create an account at [Tutum](https://dashboard.tutum.co/). After signing in:

![Overview](http://i1126.photobucket.com/albums/l605/Knorfski/overview.png)

We select to connect with AWS:

![Overview](http://i1126.photobucket.com/albums/l605/Knorfski/amazon.jpg)

We provide the keys obtained earlier:

![Overview](http://i1126.photobucket.com/albums/l605/Knorfski/credentials.jpg)

Now we are ready to use AWS. At Tutum you will required to configure the region (which should be as close to your home to minimize latency). Please keep in mind that [different regions have different pricing](http://aws.amazon.com/ec2/pricing/). For the first year after signing up, the `m1.micro` is free for 750 hours each month. Please take a look at the constraints at the pricing page.

### Digital Ocean

My favorite is digital Ocean. In stead of Amazon which is variable rate, Digital Ocean is fixed rate starting at 5$ a month. A quick tip, for Digital Ocean there are a lot of [coupons out there](https://www.google.nl/#q=coupon+digital+ocean), this can cut the costs.

[Creating a Digital Ocean account](https://cloud.digitalocean.com/registrations/new) will not be discussed here as it is very easy. Digital Ocean is much easier to configure than AWS as it uses some kind of oAuth-system to authorize Tutum. We log in to Tutum and add a cloud provider:

![Overview](http://i1126.photobucket.com/albums/l605/Knorfski/dolink.jpg)

Next we log in with our Digital Ocean credentials.

![Overview](http://i1126.photobucket.com/albums/l605/Knorfski/dologin.jpg)

And then Digital Ocean is connected with Nightscout.

![Overview](http://i1126.photobucket.com/albums/l605/Knorfski/dodone.jpg)

We're done as we can now use Digital Ocean as our cloud provider.

## Configure Tutum

From this stage we assume that you have connected your Cloud Provider with Tutum, so we can launch a VM:

![Overview](http://i1126.photobucket.com/albums/l605/Knorfski/dodone.jpg)

Next we give the VM a name and chose the region closest to you as it will reduce the latency.

![Booting](http://i1126.photobucket.com/albums/l605/Knorfski/dostar1.jpg)

Now the VM is booting and we can deploy a stack on top of the VM.

![Booting](http://i1126.photobucket.com/albums/l605/Knorfski/launchdo2.jpg)

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

Currently this deploys the [master branch of my fork of the project](https://github.com/nightscout/cgm-remote-monitor) as I don't have rights to the nightscout repository. But this will possibly fixed in the foreseeable future as a collaborator will configure it on the Nightscout repository. Every time a commit is done on the master-branch, the [Docker-hub](https://registry.hub.docker.com/u/fokkodriesprong/cgm-remote-monitor/) will build a new version of the image using a hook.

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


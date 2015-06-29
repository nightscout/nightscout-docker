### Deploying to Digital Ocean

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
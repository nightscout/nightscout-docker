### Deploying to Amazon Web Services


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
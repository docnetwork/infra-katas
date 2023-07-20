
- https://docs.aws.amazon.com/polly/latest/dg/get-started-cli-exercise.html
- https://www.freecodecamp.org/news/aws-cli-tutorial-install-configure-understand-resource-environment/
- https://tutorialsdojo.com/working-with-aws-command-line-interface-cli/
- https://www.golinuxcloud.com/aws-cli-tutorial/
- https://catalog.us-east-1.prod.workshops.aws/workshops/79521eff-62b5-4792-a2e0-6dbb59d83f4a/en-US

- boto3??

###

Other ideas:
- List all unattached volumes so that they can be deleted
- 

###
S3

Kata 1: Listing S3 buckets

In this kata, you will learn how to list all of your S3 buckets using the s3 ls command.
To do this, open a terminal window and run the following command:
aws s3 ls
This will list all of your S3 buckets, including their names and creation dates.
You can also use the -b option to specify a specific bucket to list. For example, to list the my-bucket bucket, you would run the following command:
aws s3 ls -b my-bucket
Kata 2: Creating an S3 bucket

In this kata, you will learn how to create a new S3 bucket using the s3 mb command.
To do this, open a terminal window and run the following command:
aws s3 mb my-new-bucket
This will create a new S3 bucket named my-new-bucket.
You can also use the -p option to specify a bucket policy. For example, to create a bucket with a policy that allows only you to access it, you would run the following command:
aws s3 mb my-new-bucket -p "bucket_policy"
Kata 3: Uploading a file to S3

In this kata, you will learn how to upload a file to an S3 bucket using the s3 cp command.
To do this, open a terminal window and run the following command:
aws s3 cp my-file.txt s3://my-bucket
This will upload the file my-file.txt to the my-bucket bucket.
You can also use the -r option to recursively upload an entire directory to S3. For example, to upload the directory my-directory to the my-bucket bucket, you would run the following command:
aws s3 cp -r my-directory s3://my-bucket
I hope these katas help you learn to use the aws-cli. There are many other katas that you can try, so feel free to explore the aws-cli documentation to find more.

# ECR based exercises

The following steps walk you through the steps needed to push a container image to a private Amazon ECR repository for the first time using the Docker CLI and the AWS CLI.

Original Source: [https://docs.aws.amazon.com/AmazonECR/latest/userguide/getting-started-cli.html]

## Goals

<!-- State what the goals of this kata are.   -->

## Instructions

These are the high level steps.  How to do each is detailed in the original source.

### Setup Toolchain

- Make sure you have the AWS CLI and Docker installed.
- Get your AWS account number.  You will need to insert it in the following commands
- Also note that you can update the region parameters to use a region other then us-east-1

### Exercise steps
- Create a Docker Image
  - You can use the Dockerfile included.
  - ```docker builld -t hello-world .```
  - Verify image with ```docker image --filter reference=hello-world```
- Authenticate to your default registry
  - ```aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 878788551012.dkr.ecr.us-east-1.amazonaws.com```
- Create a temp repository.  ***Long live repos should be created and managed with terraform***
  - ```
  aws ecr create-repository \
    --repository-name hello-repository \
    --image-scanning-configuration scanOnPush=true \
    --region us-east-1
  ```
  - verify your repo exists by looking the the ECR console
- Push an image to Amazon ECR
  - List docker images ```docker images```
  - Tag your image to push to your repo ```docker tag hello-world:latest 878788551012.dkr.ecr.us-east-1.amazonaws.com/hello-repository```
  - Push your image: ```docker push 878788551012.dkr.ecr.us-east-1.amazonaws.com/hello-repository```
  - verify your image was pushed by looking in the ECR console.  You may need to refresh.
- Pull an image from Amazon ECR
  - ```docker pull 878788551012.dkr.ecr.us-east-1.amazonaws.com/hello-repository:latest```
- Delete an image
  - ```
  aws ecr batch-delete-image \
      --repository-name hello-repository \
      --image-ids imageTag=latest \
      --region us-east-1
  ```
  - Note this can take a few minutes to show in the console

### Cleanup

Make sure to delete your repository
```
aws ecr delete-repository \
      --repository-name hello-repository \
      --force \
      --region us-east-1
```
## Additional Excercises
- You could do this exercise to create a container and then do the kubernetes basic exercise to deploy that container on k8s.

## External Resources

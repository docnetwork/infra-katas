# Terraform Import

In this kata you will practice importing and existing AWS object into your terraform state so that you can manage an existing AWS resource with terraform without rebuilding it.  There are times when you need to have terraform take control of an existing cloud resource.  

You might use terraform import in the following situations:
- To bring existing infrastructure under Terraform management. This can be useful if you have some infrastructure that was created outside of Terraform, and you want to start managing it with Terraform.  It can also be cumbersome for a large number of objects and the practice should be used sparingly.
- To recover from a lost or corrupted Terraform state file. If you lose your Terraform state file, you can use terraform import to recreate it from the existing infrastructure.
- To update the Terraform state with changes that were made outside of Terraform. For example, if you make a change to an AWS resource using the AWS console, you can use terraform import to update the Terraform state so that Terraform knows about the change.

Here are some of the things to keep in mind when using terraform import:

- You can only import one resource at a time.
- You need to know the ID of the resource that you want to import.
- The ID of the resource must be unique in the Terraform state.
- If you import a resource that is already managed by Terraform, Terraform will overwrite the existing configuration

## Goals

The goals of this exercise are to:

- Learn how to use the terraform import command to import an existing resource into the Terraform state.
- Understand the difference between the ID of a resource in AWS and the ID of a resource in Terraform.
- See how to use the terraform plan and terraform apply commands to apply changes to the Terraform state.

By completing this exercise, you will be able to use terraform import to bring existing infrastructure under Terraform management, recover from a lost or corrupted Terraform state file, or update the Terraform state with changes that were made outside of Terraform.

## Instructions

The following sections are intended to be high level steps that should
be followed in order.  These are not intended to be detailed step-by-step instructions but instead should lead you through the kata exercise.

<!-- Create kata phases with a level 3 headers -->
<!-- Include explanations of what is happening during each step. -->
### Setup Toolchain

For this excerise to be successful insure the following:

- terraform is installed correctly and you have AWS credentials configured so that you can build AWS resources


### Exercise steps

1. Create an EC2 instance in AWS.
    * Use the latest AMI named al2023-ami-2023*
    * Do not set any tags on this instance
2. In this directory:
    * Run terraform init to initialize the Terraform environment.
    * Run terraform plan and note what it will add or change
    * Run terraform import to import the EC2 instance into the Terraform state.
5. Run terraform plan to see what Terraform would change now that the instance has been imported.
    * You should see that terraform whats to update the tags to include the name tag.
    * If terraform wants to change more, you can update main.tf to specify the settings for the instance.  Keep updating main.tf until only the tag update is included.
6. Run terraform apply to apply the changes to the state and create the EC2 resource in Terraform.
7. Verify that the EC2 resource was updated in the aws console.

Here are some additional things to keep in mind when doing this kata:

- The ID of the EC2 instance that you create in AWS will be different from the ID of the EC2 resource that you define in your Terraform configuration file.
- You need to use the terraform import command to specify the ID of the EC2 instance that you want to import.
- The terraform import command will overwrite the existing configuration for the EC2 resource in your Terraform state.

### Cleanup
- Run terraform destroy to delete the instance
- Delete the .terraform directory and the .terraform.lock.hcl file

## Additional resources

- Terraform Import: https://www.terraform.io/docs/commands/import.html
- Terraform State: https://www.terraform.io/docs/state/index.html
- Terraform Plan: https://www.terraform.io/docs/commands/plan.html
- Terraform Apply: https://www.terraform.io/docs/commands/apply.html

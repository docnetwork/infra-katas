# Looks up the latest ami id
data "aws_ami" "latest" {
  most_recent = true
  owners      = ["137112412989"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*"]
  }
}

# Creates an instance using the latest ami id
resource "aws_instance" "web" {
  ami           = data.aws_ami.latest.id
  instance_type = "t3.micro"

  tags = {
    Name = "tf-kata"
  }
}

output "id" { value = data.aws_ami.latest.id}

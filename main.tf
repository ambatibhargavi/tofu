provider "aws" {
  access_key                  = "test"
  secret_key                  = "test"
  region                      = "us-east-1"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  endpoints {
    s3  = "http://localhost:4566"
    ec2 = "http://localhost:4566"
  }
}

# Create an S3 bucket named "tofu-bucket"
resource "aws_s3_bucket" "tofu_bucket" {
  bucket        = "tofu-bucket"
  force_destroy = true  # Ensures bucket is deleted properly
}

# Create an EC2 instance named "tofu-instance"
resource "aws_instance" "tofu_instance" {
  ami           = "ami-12345678"  # Dummy AMI for LocalStack
  instance_type = "t2.micro"

  # Add Name tag
  tags = {
    Name = "tofu-instance"
  }
}

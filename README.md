# # OpenTofu & LocalStack: Local AWS Infrastructure Automation

## Introduction

This project demonstrates how to **deploy AWS resources locally** using **OpenTofu** (an open-source Terraform alternative) and **LocalStack** (an AWS cloud emulator). With this setup, you can create and test **S3 buckets** and **EC2 instances** without using a real AWS account.

---

## 🚀 Key Benefits of OpenTofu & LocalStack

✅ **No AWS Costs** – Simulate AWS services locally.  
✅ **Faster Testing & Development** – Deploy infrastructure instantly.  
✅ **Terraform-Compatible** – Seamless migration.  
✅ **Full AWS API Emulation** – Test S3, EC2, IAM, and more.  
✅ **Open Source & Vendor-Neutral** – No licensing restrictions!  
![Your paragraph text](https://github.com/user-attachments/assets/ddadcd77-064e-4008-b4b7-5ba70dc022e9)


---

## 📌 Architecture Overview

1️⃣ **Start LocalStack** – Initializes local AWS services (S3, EC2, etc.).  
2️⃣ **Set up AWS credentials** – Uses test credentials for local authentication.  
3️⃣ **Define OpenTofu configuration** – Create an `S3 bucket` and an `EC2 instance`.  
4️⃣ **Run OpenTofu commands** – Initialize, plan, and apply the infrastructure.  
5️⃣ **Verify the resources** – Check the created S3 bucket and EC2 instance.  

![tofu drawio](https://github.com/user-attachments/assets/8ba6cdd7-fb43-4ec9-b3d6-69297f935156)

---

## 🔧 Prerequisites

Before starting, ensure you have:

- **Docker & Docker Compose** installed  
- **LocalStack** installed (`pip install localstack`)  
- **AWS CLI & OpenTofu** installed
  

---

## 🛠 Step-by-Step Setup Guide

### 1️⃣ Install LocalStack & Start the Services
```sh
pip install localstack awscli-local
localstack start
```

### 2️⃣ Set Up AWS Credentials for LocalStack
```sh
export AWS_ACCESS_KEY_ID=test
export AWS_SECRET_ACCESS_KEY=test
export AWS_SESSION_TOKEN=test
export AWS_DEFAULT_REGION=us-east-1
alias aws="aws --endpoint-url=http://localhost:4566"
```

### 3️⃣ Write OpenTofu Configuration (`main.tf`)

Define the **S3 bucket** and **EC2 instance**:
```hcl
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

resource "aws_s3_bucket" "tofu_bucket" {
  bucket        = "tofu-bucket"
  force_destroy = true
}

resource "aws_instance" "tofu_instance" {
  ami           = "ami-12345678"  # Dummy AMI for LocalStack
  instance_type = "t2.micro"
}
```

### 4️⃣ Deploy the Infrastructure with OpenTofu
```sh
tofu init
tofu plan
tofu apply -auto-approve
```

### 5️⃣ Verify the Created Resources
To check the **S3 bucket**:
```sh
aws s3 ls --endpoint-url=http://localhost:4566
```
To check the **EC2 instance**:
```sh
aws ec2 describe-instances --endpoint-url=http://localhost:4566
```


## 🎯 Conclusion
Using **OpenTofu with LocalStack** allows developers to efficiently test AWS infrastructure **without using real AWS accounts or spending money**. This setup is ideal for **CI/CD pipelines, local testing, and rapid prototyping**.
🚀 If you found this guide helpful, give it a ⭐ on GitHub and feel free to contribute!  
![OPENTOFUonline-video-cutter com-ezgif com-video-to-gif-converter](https://github.com/user-attachments/assets/5f9fc6e9-6f0c-4c79-b4ad-ba82d4f852c3)
![Screenshot 2025-03-16 at 16 38 32](https://github.com/user-attachments/assets/b0b6f92a-7427-4b4c-a019-630ec37e853f)
![Screenshot 2025-03-16 at 16 38 09](https://github.com/user-attachments/assets/e4a63f08-f327-47bc-981b-46c114702674)
<img width="1060" alt="Screenshot 2025-03-16 at 16 32 56" src="https://github.com/user-attachments/assets/220ad8e2-3e63-41d3-aa27-de95bc05f9ef" />
<img width="1433" alt="Screenshot 2025-03-16 at 16 32 45" src="https://github.com/user-attachments/assets/3f5130d4-4f05-4f8b-a908-1ab6df0f8999" />



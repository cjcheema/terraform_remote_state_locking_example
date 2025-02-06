# Terraform S3 State Locking Without DynamoDB

This repository contains Terraform code for setting up remote state storage in AWS S3 with native state locking, eliminating the need for DynamoDB. With Terraform 1.10+, HashiCorp introduced native S3 locking using `use_lockfile = true`, making state management simpler and cost-effective.

## Prerequisites

Before using this repository, ensure you have:

- Terraform 1.10 or later installed ([Download Terraform](https://developer.hashicorp.com/terraform/downloads))
- AWS CLI installed and configured with appropriate permissions ([AWS CLI Installation Guide](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html))
- An AWS account with permissions to create S3 buckets

## Getting Started

### Step 1: Clone the Repository

```sh
git clone https://github.com/cjcheema/terraform_remote_state_locking_example.git
cd terraform_remote_state_locking_example
```

### Step 2: Create an S3 Bucket for State Storage

Use AWS CLI to create an S3 bucket:

```sh
aws s3api create-bucket --bucket your-bucket-name --region your-region --create-bucket-configuration LocationConstraint=your-region
```

Enable versioning for state tracking:

```sh
aws s3api put-bucket-versioning --bucket your-bucket-name --versioning-configuration Status=Enabled
```

### Step 3: Update the Terraform Backend Configuration

Modify `backend.tf` (or `main.tf`) to reference your S3 bucket:

```hcl
terraform {
  backend "s3" {
    bucket       = "your-bucket-name"
    key          = "path/to/your/statefile"
    region       = "your-region"
    use_lockfile = true  # Enables native S3 state locking
  }
}
```

### Step 4: Initialize Terraform

Run the following command to initialize Terraform and apply the backend configuration:

```sh
terraform init
```

### Step 5: Apply Terraform Configuration

To provision your infrastructure, run:

```sh
terraform apply
```

This will store your Terraform state securely in S3 and enable native state locking.

## Benefits of Native S3 Locking

- No need for DynamoDB, reducing costs and complexity
- Secure and reliable state locking managed directly in S3
- Simpler setup with just one configuration change

# Author

This project is created and maintained by Charanjit Singh.
* Email: charanjit.singh@outlook.in/charanjit.cheema@cjcheema.com
* Website: https://www.cjcheema.com
* LinkedIn: https://www.linkedin.com/in/cjcheema/

Feel free to connect for any questions, suggestions, or feedback.
terraform {
    backend "s3" {
        bucket         = "cj-tf-state" # This is the name of the S3 bucket which I created 
        key            = "RDS_SG/terraform.tfstate" # This is the name of the state file in the bucket. You can name it whatever you want.
        region         = "ap-south-1" # This is the region where the bucket is located
        use_lockfile   = true  # This enables native S3 state locking
    }
}
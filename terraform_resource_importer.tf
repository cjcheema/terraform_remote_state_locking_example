resource "aws_security_group" "existing_sg" {
  name        = "RDSSecurityGroup"
  description = "This security group was created manually but now we are managing it with Terraform."
  vpc_id      = var.vpcid # The VPC ID is parameterized for security reasons. In your code, either replace it here with your actual VPC ID or provide it in a *.tfvars file, as I have done.

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [var.cidr_block] # Referencing the parameterized CIDR block due to security reasons. Replace it with your actual CIDR block or provide it in a *.tfvars file.
  }
}

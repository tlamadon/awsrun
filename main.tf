data "aws_availability_zones" "available" {
  state = "available"
}

module "batch_compute_environment" {

  source = "QuiNovas/batch-compute-environment/aws"

  name                   = "test-terraform"
  type                   = "MANAGED"
  compute_resources_type = "SPOT"
  instance_type          = ["optimal"]
  min_vcpus              = 0
  desired_vcpus          = 0
  max_vcpus              = 16
  image_id               = "ami-0c57b7a2379a0da94" 
  #"ami-066d3f9ecb89d2ace"

  availability_zones     = data.aws_availability_zones.available.names
  cidr_block             = "10.0.0.0/16"

  tags = {
    Terraform = "true"
    Environment = "dev"
  }

}
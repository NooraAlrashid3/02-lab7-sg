module "public_services_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.17.1"

  name        = "public-services-sg"
  description = "Allow access to public services"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 80
      protocol    = "tcp"
      description = "port80 for load balancer"
      cidr_blocks = "0.0.0.0/0"
    }]

  # egress_with_cidr_blocks = [
  #   {
  #     from_port   = 0
  #     to_port     = 80
  #     protocol    = "tcp"
  #     description = "port80 for load balancer"
  #     cidr_blocks = "0.0.0.0/0"
  #   }]


  # ingress_cidr_blocks = ["0.0.0.0/0"]
  # ingress_rules       = ["http-80-tcp"]

  egress_rules = ["all-all"] # any protocol, any port

}
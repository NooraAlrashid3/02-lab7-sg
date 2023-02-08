module "app_services_sg" {
    source  = "terraform-aws-modules/security-group/aws"
    version = "4.17.1"

    name        = "app-services-sg"
    description = "Allow access to app services"
    vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id


# ingress_with_cidr_blocks = [
#     {
#       from_port   = 0
#       to_port     = 80
#       protocol    = "tcp"
#       description = "port80 for load balancer"
#       cidr_blocks = "0.0.0.0/0"
#     }]
#     ingress_cidr_blocks = ["0.0.0.0/0"]
#     ingress_rules       = ["http-80-tcp", "https-443-tcp"]

    ingress_with_cidr_blocks = [
    {
        from_port   = 0
        to_port     = 80
        protocol    = "tcp"
        description = "port80 for load balancer"
        cidr_blocks = "0.0.0.0/0"
    }]
    egress_rules = ["all-all"]
}
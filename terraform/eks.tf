module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name    = local.cluster_name
  cluster_version = "1.25"

  enable_irsa                    = true
  cluster_endpoint_public_access = true

  vpc_id     = module.assignment_vpc.vpc_id
  subnet_ids = module.assignment_vpc.private_subnets
}

resource "aws_eks_fargate_profile" "default" {
  cluster_name           = module.eks.cluster_name
  fargate_profile_name   = "default"
  pod_execution_role_arn = aws_iam_role.fargate.arn

  selector {
    namespace = "default"
  }

  selector {
    namespace = "kube-system"
  }
}

resource "aws_iam_role" "fargate" {
  name               = "fargate"
  assume_role_policy = jsonencode({
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = [
            "eks-fargate-pods.amazonaws.com"
          ]
        }
      }
    ]
    Version ="2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "fargate_pod_execution" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSFargatePodExecutionRolePolicy"
  role       = aws_iam_role.fargate.name
}

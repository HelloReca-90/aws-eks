resource "aws_iam_role" "eks-terraform" {
  name = "eks-cluster-teste"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "eks-terraform-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks-terraform.name
}

resource "aws_iam_role_policy_attachment" "eks-terraform-AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = aws_iam_role.eks-terraform.name
}

resource "aws_eks_cluster" "teste" {
  name     = "teste"
  role_arn = aws_iam_role.eks-terraform.arn

  vpc_config {
    subnet_ids = var.subnet_ids
    }

  depends_on = [
    aws_iam_role_policy_attachment.eks-terraform-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.eks-terraform-AmazonEKSServicePolicy
    ]

  tags = var.default_tags
}

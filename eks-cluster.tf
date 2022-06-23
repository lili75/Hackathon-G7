resource "aws_eks_cluster" "groupe7-cluster" {
  name     = var.cluster-name
  role_arn = aws_iam_role.groupe7-cluster-role.arn

  vpc_config {
    security_group_ids = [aws_security_group.groupe7-cluster-group.id]
    subnet_ids = module.vpc.public_subnets
  }

  depends_on = [
    aws_iam_role_policy_attachment.groupe7-cluster-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.groupe7-cluster-AmazonEKSServicePolicy,
  ]
}

resource "aws_eks_cluster" "demo" {
  name     = var.cluster-name
  role_arn = aws_iam_role.demo.arn

  vpc_config {
    subnet_ids = var.subids
  }

  
  depends_on = [
    aws_iam_role_policy_attachment.demo-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.demo-AmazonEKSVPCResourceController,
  ]
}
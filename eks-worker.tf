resource "aws_eks_node_group" "main" {
  cluster_name    = aws_eks_cluster.demo.name
  node_group_name = "demo-k8s"
  node_role_arn   =  aws_iam_role.demo_eks_node_group_role.arn
  subnet_ids      = var.subids
  instance_types =  ["t2.medium"]
  
  
  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  tags = {
    Name        = "${var.name}-${var.environment}-eks-node-group"
    Environment = var.environment
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]
}
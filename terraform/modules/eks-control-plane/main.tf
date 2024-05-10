resource "aws_iam_role" "audrey_cluster_role" {
  name               = format("%s-%s-control-plane-role", var.tags.id, var.tags.owner)
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

resource "aws_iam_role_policy_attachment" "amazon_eks_cluster_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.audrey_cluster_role.name
}

resource "aws_eks_cluster" "audrey_cluster" {
  name     = format("%s-audrey-cluster", var.tags.id)
  role_arn = aws_iam_role.audrey_cluster_role.arn
  version  = var.cluster_version

  vpc_config {
    endpoint_private_access = var.endpoint_private_access
    endpoint_public_access  = var.endpoint_public_access
    subnet_ids = [
      data.aws_subnet.audrey_public-01.id,
      data.aws_subnet.audrey_public-02.id,
      data.aws_subnet.audrey_public-03.id
    ]
  }
  depends_on = [
    aws_iam_role_policy_attachment.amazon_eks_cluster_policy
  ]
}


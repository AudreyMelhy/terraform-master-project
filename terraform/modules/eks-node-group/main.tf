resource "aws_eks_node_group" "green-nodes" {
  cluster_name    = format("%s-%s-cluster", var.tags.id, var.tags.environment)
  node_group_name = format("%s-%s-green-node-group", var.tags.id, var.tags.environment)
  node_role_arn   = aws_iam_role.nodes.arn

  version = var.cluster_version

  subnet_ids = [
    data.aws_subnet.audrey_private-01.id,
    data.aws_subnet.audrey_private-02.id,
    data.aws_subnet.audrey_private-03.id
  ]

  capacity_type = var.capacity_type
  ami_type      = var.ami_type

  instance_types = [var.instance_types]
  disk_size      = var.disk_size

  remote_access {
    ec2_ssh_key = var.ec2_ssh_key
  }

  scaling_config {
    desired_size = var.green_node_color == "green" && var.green ? var.desired_node : 0
    min_size     = var.green_node_color == "green" && var.green ? var.node_min : 0
    max_size     = var.green_node_color == "green" && var.green ? var.node_max : var.node_max
  }

  # labels = {
  #   deployment_nodegroup = var.deployment_nodegroup
  # }

  tags = merge(var.tags, {
    Name                                                  = format("%s-%s-green-node-group", var.tags.id, var.tags.environment)
    "k8s.io/cluster-autoscaler/${var.control_plane_name}" = "${var.shared_owned}"
    "k8s.io/cluster-autoscaler/enabled"                   = "${var.enable_cluster_autoscaler}"
    },
  )
}

resource "aws_eks_node_group" "blue-nodes" {
  cluster_name    = format("%s-%s-cluster", var.tags.id, var.tags.environment)
  node_group_name = format("%s-%s-blue-node-group", var.tags.id, var.tags.environment)
  node_role_arn   = aws_iam_role.nodes.arn

  subnet_ids = [
    data.aws_subnet.audrey_private-01.id,
    data.aws_subnet.audrey_private-02.id,
    data.aws_subnet.audrey_private-03.id
  ]

  version = var.cluster_version

  capacity_type = var.capacity_type
  ami_type      = var.ami_type

  instance_types = [var.instance_types]
  disk_size      = var.disk_size

  remote_access {
    ec2_ssh_key = var.ec2_ssh_key
  }

  scaling_config {
    desired_size = var.blue_node_color == "blue" && var.blue ? var.desired_node : 0
    min_size     = var.blue_node_color == "blue" && var.blue ? var.node_min : 0
    max_size     = var.blue_node_color == "blue" && var.blue ? var.node_max : var.node_max
  }

  # labels = {
  #   deployment_nodegroup = var.deployment_nodegroup
  # }

  tags = merge(var.tags, {
    Name                                                  = format("%s-%s-green-node-group", var.tags.id, var.tags.environment)
    "k8s.io/cluster-autoscaler/${var.control_plane_name}" = "${var.shared_owned}"
    "k8s.io/cluster-autoscaler/enabled"                   = "${var.enable_cluster_autoscaler}"
    },
  )
}


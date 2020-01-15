# variable

variable "region" {
  default = "ap-northeast-2"
}

variable "name" {
  default = "seoul-dev-demo-eks"
}

variable "vpc_id" {
  default = ""
}

variable "public_subnets" {
  default = [
    {
      suffix = "svc1-a"
      zone   = "ap-northeast-2a"
      cidr   = "10.10.11.0/24"
      tags = [
        "kubernetes.io/cluster/seoul-dev-demo-eks-svc1-a", "shared"
      ]
    },
    # {
    #   suffix = "svc1-b"
    #   zone   = "ap-northeast-2b"
    #   cidr   = "10.10.2.0/24"
    #   tags = [
    #     "kubernetes.io/cluster/seoul-dev-demo-eks-svc1-b", "shared"
    #   ]
    # },
    {
      suffix = "svc1-c"
      zone   = "ap-northeast-2c"
      cidr   = "10.10.13.0/24"
      tags = [
        "kubernetes.io/cluster/seoul-dev-demo-eks-svc1-c", "shared"
      ]
    },
  ]
}

variable "private_subnets" {
  default = [
    {
      suffix = "svc2-a"
      zone   = "ap-northeast-2a"
      cidr   = "10.10.14.0/24"
      tags = [
        "kubernetes.io/cluster/seoul-dev-demo-eks-svc2-a", "shared"
      ]
    },
    # {
    #   suffix = "svc2-b"
    #   zone   = "ap-northeast-2b"
    #   cidr   = "10.10.15.0/24"
    #   tags = [
    #     "kubernetes.io/cluster/seoul-dev-demo-eks-svc2-b", "shared"
    #   ]
    # },
    {
      suffix = "svc2-c"
      zone   = "ap-northeast-2c"
      cidr   = "10.10.16.0/24"
      tags = [
        "kubernetes.io/cluster/seoul-dev-demo-eks-svc2-c", "shared"
      ]
    },
  ]
}

variable "enable_nat_gateway" {
  default = true
}

variable "tags" {
  default = {}
}

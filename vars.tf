variable "cluster-name" {
    default  = "test"
    type = string
}

variable "subids" {
    type = list(string)
    default = ["subnet-550f1a3d" , "subnet-93cdb6df"]	
}

variable "vpcid" {
    type = string
    default = "vpc-2a3bd741"
}
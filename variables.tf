# Arquivo destinado a declarar as variáveis

variable "region" {
  description = "AWS region"
}

variable "vpc_id" {
  type = string
  description = "VPC que será utilizada"
} 

variable "subnet_ids" {
  type = list
  description = "subnets que serão utilizadas"
}

variable "inst_type" {
  type = list
  description = "Familia da instância"
}

variable "inst_key" {
  type = string
  description = "Chave que deve ser utilizada"
}

variable "default_tags" {
  type        = map
  description = "Tags a serem aplicadas à nossa instância."
}

variable "environment" {
  description       = "Define o ambiente que está sendo tratado no código"
  type              = string
  default = "dev"
}

variable "subnet_list" {
  description = "Mapa chave-valor contendo o nome da subnet e seu respectivo cidr_block"
  type = map(string)
}

/*
variable "users" {
  description       = "Lista de usuários para acessar o bucket"
  type              = list(string)
}
*/
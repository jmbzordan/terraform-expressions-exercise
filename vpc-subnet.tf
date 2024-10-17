resource "aws_vpc" "vpc" {
  cidr_block        = "10.0.0.0/16"

  tags = {
    Name            = "vpc-expression-exercise"
  }
}
/*
# https://developer.hashicorp.com/terraform/language/meta-arguments/count
# Documentação de utilização do count

# https://developer.hashicorp.com/terraform/language/expressions/conditionals
# DOcumentação sobre expressões condicionais

# Declaração de um resource que resultará em uma lista de Subnets através do count que define 
# a quantidade através de uma expressão condicional do valor da variável environment
resource "aws_subnet" "subnet_vpc" {
  count             = ( (var.environment == "prod") ? 4 : 3)    # Se o ambiente for "prod", o número de subnets é 4, senão é 3

  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.${count.index+1}.0/24"    #o valor do cidr de cada subnet varia conforme a quantidade de subnets, definido pelo index do count. +1 pois começa em 0
  tags = {
    Name            = "subnet-expression-exercise-${count.index+1}"   # O nome de cada subnet também varia com o index do count
  }
}
*/

# https://developer.hashicorp.com/terraform/language/meta-arguments/for_each
# Documentacao de utilizaçao do for_each

# Declaração de um resource que resultará em um map de Subnets através do for_each que define 
# a quantidade através do número de entradas chave-valor da variável map "subnet_list"
resource "aws_subnet" "subnet_vpc" {
  for_each = var.subnet_list

  vpc_id = aws_vpc.vpc.id
  cidr_block = each.value
  tags = {
    Name = "${each.key}-expression-exercise"
  }
}
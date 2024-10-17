######################################################################################
# https://developer.hashicorp.com/terraform/language/expressions/for
# DOcumentacao do for e suas possibilidades

#Declaracao dos outputs para o exemplo de criação das subnets com o for_each, que cria um map
output "subnets_foreach_for" {
  description = "Imprime usando um for, as subnets criadas atraves do for_each"
  value = {for key,value in aws_subnet.subnet_vpc : key => value.cidr_block}        # Como o for é em cima de um map, é entre {} e a iteração passa key,value
}                                                                                   # e imprime no formato "key" => "value". Como o value é um map também, passamos o cidr dessa forma

/*
OUTPUT utilizando o FOR em cima de um map resultado de um for_each
Variavel com 3 subnets de entrada

subnets_foreach_for = {
  "subnet-1" = "10.0.1.0/24"
  "subnet-2" = "10.0.2.0/24"
  "subnet-3" = "10.0.3.0/24"
}

OUTPUT utilizando o for em cima de um map resultado de um for_each
Variavel com 3 subnets de entrada

subnets_foreach_for = {
  "subnet-1" = "10.0.1.0/24"
  "subnet-2" = "10.0.2.0/24"
  "subnet-3" = "10.0.3.0/24"
  "subnet-4" = "10.0.4.0/24"
}
*/
######################################################################################

#------------------------------------------------------------------------------------

######################################################################################
/*
# https://developer.hashicorp.com/terraform/language/expressions/for
# DOcumentacao do for e suas possibilidades

# Declaracao dos outputs para o exemplo de criação das subnet com o count, que cria uma lista
output "subnets_count_for" {
  description = "Imprime usando um for, as subnets criadas através do count"
  value = [for subnet in aws_subnet.subnet_vpc : subnet.id]           # Utiliza-se um "for" para percorrer a lista de resource subnet gerada pelo count do resouce,
}                                                                     # e para cada subnet da lista, imprime o seu ID.

# https://developer.hashicorp.com/terraform/language/expressions/splat
# Documentacao sobre splat expressions

output "subnets_count_splat" {
  description = "Imprime usando uma splat, as subnets criadas através do count"         # Utiliza-se uma splat expression para imprimir todos IDs 
  value = aws_subnet.subnet_vpc[*].id                                                   # das subnets na lista criada pelo count
}

OUTPUT com as duas alternativas:

subnets_for = [
  "subnet-05114ebc75a0d165e",
  "subnet-0636854e2614c737b",
  "subnet-0311cad966e8f9337",
  "subnet-00ea1a8d9bcfdafc7",
]
subnets_splat = [
  "subnet-05114ebc75a0d165e",
  "subnet-0636854e2614c737b",
  "subnet-0311cad966e8f9337",
  "subnet-00ea1a8d9bcfdafc7",
]
*/
######################################################################################
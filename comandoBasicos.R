#Vetores

#Criando um vetor
?c()

cidade <- c ("Brasília",
             "São Paulo",
             "Rio de Janeiro",
             "Porto Alegre")

#Visualizando os dados do vetor 
cidade

temperatura <- c (32, 22, 35, 17)

regiao <- c (1, 2, 2, 3)

#Acessando o primeiro elemento
cidade [1]

#Acessando um intervalo de elementos
temperatura [1:3]

#Copiando um vetor
cidade2 <- cidade
cidade2

#Excluindo o segundo elemento da consulta
temperatura [-2]

#Alterando um vetor
cidade2 [3] <- "Belo Horizonte"

#Adicionando um novo elemento
cidade2[5] <- "Curitiba"
cidade2

#Deletando o vetor
cidade2 <- NULL
cidade2

#fatores
?factor

UF <- factor(c("DF","SP","RJ","RS"))
UF

grau.instruçao <- factor(c("Nível Médio",
                           "Superior",
                           "Nível Médio",
                           "Fundamental"),
                         levels = c("Fundamental",
                                    "Nível Médio",
                                    "Superior"),
                         ordered = TRUE)
grau.instruçao

#Listas
?list()

pessoa <- list (Sexo = "M",
                cidade = cidade[1],
                idade = 20)
pessoa

#Acessando o primeiro elemento da lista
pessoa[1]

#editando a lista
pessoa [["idade"]] <- 22
pessoa

#Deletando elemento da lista
pessoa [["idade"]] <-NULL
pessoa

#Crinado novamente a lista
pessoa <- list (sexo = "M",
                cidade[1],
                idade = 20)

#Filtrando elementos da lista
pessoa [c ("cidade", "idade")]

#Lista de listas
cidades <- list(cidade = cidade,
                temperatura = temperatura,
                regiao = regiao)
cidades

#Crinado um data frame com vetores
df <- data.frame(cidade, temperatura)
df

df2 <- data.frame(cidades)
df2

#Filtrando valores do data frame
#Recupernado o valor da linha 1, coluna 2
df[1,2]

#Recuperando todas as linhas da primeira coluna
df[, 1]

#Repurando a Primeira linha e todas as colunas
df[1,]

#Selecionando as 3 primeiras linhas da primeira e última coluna
df2 [c(1:3), c(1,3)]

#Verificando o nome das colunas
names(df)

#Verificando número de linhas x colunas
dim(df)

#Verificando os tipos de dados
str(df)

#Acessar uma coluna do dataframe
df$cidade
df ['cidade']

#Matrizes

#Criando uma matriz
m <- matrix(seq(1:9), nrow = 3)
m

m2 <- matrix(seq(1:25),
             ncol = 5,
             byrow = TRUE,
             dimnames = list(c(seq(1:5)),
                             c('A', 'B', 'C', 'D', 'E')))
m2

#Filtrando a matriz
m2[c(1:2), c("B", "C")]


#Loops

#For

#for (valor in sequencia){
#  código...
#}

?seq

#Exemplo for
for (i in seq(12)) {
  print(i)
}

#While

# while(condição){
# código...
#}

#Exemplo while

i <- 0
while (i <= 10) {
  print(i)
  
  i = i + 1
}

#Controle de fluxo

#if(condição){
#  código...
#}

#Exemplo - Controle de fluxo

x = 10
if (x > 0){
  print("Número Positivo")
}

nota = 4
if (nota >= 7){
  print("Aprovados")
}else if (nota > 6 && nota < 7){
  print("Recuperação")
}else{
  print("Reprovado")
}

#Estrutura da função

#nome.funcao <- function(argumento){
#  código
#}

#Criando a função
par.impar <- function(num){
  if((num %% 2) == 0){
    return("Par")
  }else
    return("Ímpar")
}

#usando a função
num = 3
par.impar(num)

#Funções do Apply()
?apply

x <- seq(1:9)
x

matriz <- matrix(x, ncol = 3)
matriz

result1 <- apply(matriz, 1, sum)
result1

result2 <- apply (matriz, 2,sum)
result2

?list

numeros.p <- c(2, 4, 6, 8, 10, 12)  
numeros.i <- c(1, 3, 5, 7, 9, 11)

numeros <- list(numeros.p, numeros.i)
numeros

?lapply
lapply(numeros, mean)

?sapply
sapply(numeros, mean)

#Gráficos

#dataset/conjutos de dados
?mtcars

#filtrando colunas do dataset
carros <- mtcars[, c(1, 2, 9)]

#Visualizando o dataset
head(carros)

#Histograma
hist (carros$mpg)

#Gráfico de dispersão
plot(carros$mpg, carros$cyl)

install.packages("ggplot2")
library(ggplot2)

#Criando gráfico de barras com ggplot2
ggplot(carros, aes(am))+
  geom_bar()
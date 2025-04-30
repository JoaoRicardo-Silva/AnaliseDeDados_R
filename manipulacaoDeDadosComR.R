#Join

#instalando e carregando o pacote
install.packages("dplyr")
library(dplyr)

??dplyr
?data.frame

df1 <- data.frame (Produto = c(1, 2, 3, 5), Preco = c (15, 10, 25, 20) )
head(df1)

df2 <- data.frame (Produto = c(1, 2, 3, 4), Nome = c ("A", "B", "C", "D"))
head(df2)

#Resultado da junção df1 + df2 usando left join
df3 <- left_join(df1, df2, "Produto")
head(df3)

#Resultado da junção df1 + df2 usando right join
df4 <- right_join(df1, df2, "Produto")
head(df4)

#Resultado da junção df1 + df2 usando inner join
df5 <- inner_join (df1, df2, "Produto")
head(df5)

#Selecionando os dados

install.packages("dplyr")
library (dplyr)

? iris

#dataset iris
head(iris)

#visualizando o tipo dos dados com glimpse
glimpse(iris)

#Filter - filtrando os dados - apenas versicolor
versicolor <- filter(iris, Species == "versicolor")
versicolor
dim(versicolor)

#Slice - Selecionando algumas linhas especificas
slice (iris, 5:10)

#Select - selecionando algumas colunas
select (iris, 2:4)

#selecionando todas as colunas exceto Sepal width
select (iris, -Sepal.Width)

#Criando uma nova coluna com base em colunas existentes (Sepal.Length + Sepal.Width)
iris2 <- mutate (iris, nova.coluna = Sepal.Length + Sepal.Width)
iris2 [,c("Sepal.Length", "Sepal.Width", "nova.coluna")]

#Arrange - ordenar os dados
?arrange

select (iris, Sepal.Length) %>%
    arrange (Sepal.Length)

#Group by - agrupando os dados
?group_by

#Agrupando os dados - Tamanho médio da sépela por espécie
iris %>% group_by(Species) %>%
    summarise (mean(Sepal.Length))


#Transformando os dados

#Tidyr
install.packages("tidyr")
library(tidyr)

#Quantidade de vendas por ano e produto

#Dataframe - Quantidade de Produtos por Ano
dfDate <- data.frame(Produto = c('A', 'B', 'C'),
                        A.2015 = c(10, 12, 20),
                        A.2016 = c(20, 25, 35),
                        A.2017 = c(15, 20, 30))

head(dfDate)

#Utilizando a função gather para mudar o formato da tabela
?gather

dfDate2 <- gather(dfDate, "Ano", "Quantidade", 2:4)
head(dfDate2)

install.packages ("dplyr")
library(dplyr)

?separate

#Criando uma nova coluna para separar os dados
dfDate3 <- separate(dfDate2, Ano, c("A", "Ano"))
dfDate3

#Removendo a coluna
dfDate3 <- dfDate3[-2]
dfDate3

#Acrescentando uma coluna Mês
dfDate3$Mes <- c('01', '02', '03')

dfDate3

#Fazendo a união da coluna Ano e Mês

?unite

#Criando a coluna Data para receber Mês e Ano - separado por /
dfDate4 <- dfDate3 %>%
    unite (Data, Mes, Ano, sep = '/')

dfDate4

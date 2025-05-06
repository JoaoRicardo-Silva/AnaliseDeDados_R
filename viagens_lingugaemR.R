#DEFINIÇÂO DO PROBLEMA

#Precsaimos entender os gsatos com a viagens a serviço para tomar medidas mais eficentes e, com isso, reduzir os custos das viagens a serviço.
#Vamos levantar algumas questões relevantes acerca dessa problemática:
#1. Qual é o valor gasto por orgão?
#2. Qual é o valor gasto por cidade?
#3. QUal é a quantidade de viagens por mês?

### OBTENÇÃO DOS DADOS

#Usaremos o arquivo "2019_viagens.csv" disponível neste no mesmo repositório deste projeto.
#Coloque o caminho do arquicvo desde a raiz do seu computador.

?read.csv

viagens <- read.csv( 
    file = "/home/rick/Documentos/GitHub/AnaliseDeDados_R/2019_Viagem.csv", 
    sep = ";", 
    dec = ',',
    fileEncoding = "latin1" #para ler o arquivo com acentuação
)

#Visualizando as primeiras linhas do dataset - verificar se os dados foram lidos corretamente.
head(viagens)

View(viagens)

#Verificar dimensões do dataset
dim(viagens)

?summary

#Resumo do dataset - valores min, max, media, mediana...
summary(viagens)

#Summary de uma coluna especifica
summary (viagens$Valor.passagens)

#Verificar tipo dos dados

install.packages("dplyr")
library (dplyr)

glimpse(viagens)

### TRANSFORMAÇÃO DOS DADOS OBTIDOS
#Convertendo o tipo do dato para tipo Date
?as.Date

viagens$data.inicio <- as.Date(viagens$Período...Data.de.início, "%d/%m/%Y")

glimpse(viagens)

#Formatando a adata de início - para utilizar apenas Ano/Mês
?format
viagens$data.inicio.formatada <- format(viagens$data.inicio, "%Y-%m")
viagens$data.inicio.formatada

### EXPLORAÇÃO DOS DADOS 

#Gerando histograma da coluna passagens
hist(viagens$Valor.passagens)

#Outro exemplo de histograma - filtrando valores

#Para esse exemplo serão utilizadas as funções filter e select
?dplyr::filter
?dplyr::select

#Filtrando os valores das passagens - apenas passagens entre 200 e 5000
passagens_filtro <- viagens %>%
    select (Valor.passagens) %>%
    filter (Valor.passagens >= 200 & Valor.passagens <= 5000)

passagens_filtro
hist (passagens_filtro$Valor.passagens)

#Verificando os valores min, max, média... da coluna valor
summary (viagens$Valor.passagens)

#Visualizando os valores em um boxplot
boxplot (viagens$Valor.passagens)

#Visualizando os valores das passagens - filtro de 200 a 5000
boxplot (passagens_filtro$Valor.passagens)

#Calculando o desvio padrão
sd (viagens$Valor.passagens)

#Verificar se existem valores não preenchidos nas colunas do datadrame
?is.na

?colSums

colSums (is.na(viagens))

#Verificar a quantidade de categorias da coluna Situação

#Converter para factor
viagens$Situação <- factor (viagens$Situação)

str (viagens$Situação)

#Verificar quantidade de registros em cada categoria
table (viagens$Situação)

#Obtendo os valores em percentual de cada categoria
prop.table (table(viagens$Situação)) * 100


### VISUALIZAÇÃO DOS RESULTADOS

# 1. Qual é o valor gasto por orgão em passagens?

#Criando um dataframe com os 15 órgãos que gastam mais
library (dplyr)
p1 <- viagens %>%
    group_by (Nome.do.órgão.superior) %>%
    summarise (n = sum(Valor.passagens)) %>%
    arrange (desc(n)) %>%
    top_n(15)

#Altenrando o nome das colunas
names(p1) <- c("orgao", "valor")

p1

#Plotando os dados com o ggplot
library (ggplot2)
ggplot(p1, aes(x = reorder(orgao, valor), y = valor))+
  geom_bar(stat = "identity")+
  coord_flip()+
  labs(x = "Valor", y = "Órgãos")

# 2. Qual é o valor gasto por cidade?

#Criando um dataframe com os 15 cidades que gastam mais

p2 <- viagens %>%
    group_by (Destinos) %>%
    summarise (n = sum(Valor.passagens)) %>%
    arrange (desc(n)) %>%
    top_n(15)

p2

#alterando o nome das colunas
names (p2) <- c ("destino", "valor")
p2

#Criando o gráfico
ggplot(p2, aes(x = reorder(destino, valor), y = valor))+
  geom_bar(stat = "identity", fill = "#0ba791")+
  geom_text(aes(label = valor), vjust = 0.3, size = 3)+
  coord_flip()+
  labs(x = "Valor", y = "Destino")

#options(scipen = 999)

# 3. Qual é a quantidade de viagens por mês?

#Crinado um dataframe com a quantidade de viagens por Ano/mês
p3 <- viagens %>%
    group_by (data.inicio.formatada) %>%
    summarise (qtd = n_distinct(Identificador.do.processo.de.viagem))

head (p3)

#Crinado o gráfico
ggplot (p3, aes(x = data.inicio.formatada, y = qtd, group = 1))+
    geom_line()+
    geom_point()

#Relembrando que todas as imagens plot geradas pelo ggplot estaram disponiveis neste projeto na pasta "img"

#Exemplo de utilização do R markdown

#Na linguagem R é possível usar o Markdown para formatar os seus relatórios

#Instalação do Rmarkdown
install.packages("rmarkdown")
install.packages('tinytex')
library(tinytex)

#Esta linha por demorar um pouco para ser executada, acompanhe o processo na aba console e só prossiga após o fim da instalação
tinytex::install_tinytex()

# Próximos passos
# Criar um arquivo R Markdown: File > New File RMarkdown
# Criar script
# Gerar Relatório: Knit > Knit to PDF

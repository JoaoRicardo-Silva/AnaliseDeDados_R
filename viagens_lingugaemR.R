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




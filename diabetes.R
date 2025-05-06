# Carregando os dados
#Vale lembrar que o caminho fornecido deve vir desde a Raíz do seu computador, no meu caso uso Linux, por isso está partindo do /

diabetes <- read.csv(
  file = "/home/rick/Documentos/GitHub/AnaliseDeDados_R/diabetes.csv", 
)

head(diabetes)

### DEFINIÇÃO DO PROBLEMA

#Identificar pacientes com alta probabilidade de setem diagnosticados com diabetes, tendo, no mínimo, 75% de acurácia.


### OBTENÇÃO DOS DADOS

#Necessitamos do arquivo "diabetes.csv" disponível no clone deste projeto
#Carregar com o read.csv()

### PREPARAÇÃO DOS DADOS

#Verificando o tipo dos dados das colunas do dataset
?str
str(diabetes)

#Verificando a proporção dos valores de cada categoria
?table
table(diabetes$Outcome)

#alterando o tipo da coluna "Outcome" que é int para factor
diabetes$Outcome <- as.factor(diabetes$Outcome)


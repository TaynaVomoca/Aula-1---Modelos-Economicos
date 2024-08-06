#Importação dos dados

install.packages("readr") #instala pacote
library(readr) #carrega pacote

#carrega dados
dados <- read.csv("C:/Users/20231enpro0291/Downloads/olimpiadas.csv") 

#########################
#tabelas de frenquência
########################
#tabelas simples
#########################

table(dados$Sex) #valores absolutos
table(dados$Sex)/nrow(dados) #valores relativos

#tabela de dupla entrada

table(dados$Sex, dados$NOC)

##########################
#dado somente do brasil
##################

install.packages("dplyr")
library(dplyr)

dados_brasil <- dados %>% filter(NOC == "BRA")

table(dados)

#######################
#Gráficos
#####################

install.packages("esquisser")
library(esquisse)


library(ggplot2)

ggplot(dados) +
 aes(x = Sex) +
 geom_bar(fill = "#112446") +
 theme_minimal()

##############################
#estatisticas descritivas
###############################
#estatisticas descritivas para a idade dos atletas

min(dados$Age, na.rm = TRUE) #minimo
max(dados$Age, na.rm = TRUE)#máximo
mean(dados$Age, na.rm = TRUE)#Média
sd(dados$Age, na.rm = TRUE)#desvio-padrao

esquisser(dados)

dados_F <- dados %>% filter(NOC == "F")
mean(dados_F$Weight, na.rm = "TRUE")

dados_M <- dados %>% filter(NOC == "M")
mean(dados_M$Weight, na.rm = "TRUE")

dados %>% group_by(Sex) %>% summarise(media = mean(Weight, na.rm = TRUE))



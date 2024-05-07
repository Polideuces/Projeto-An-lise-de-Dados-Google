---
title: "Compartilhamento de bicicleta"
author: "Cássio Lanna"
date: "2023-05-04"
output:
  html_document: default
  pdf_document: default
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# Compartilhamento de bicicleta

## Cenário

  Você é um analista de dados júnior que trabalha na equipe de analistas de marketing da Cyclistic, uma empresa de compartilhamento de bicicletas em Chicago. O diretor de marketing acredita que o sucesso futuro da empresa depende da maximização do número de planos anuais contratados. Portanto, sua equipe quer entender como os ciclistas casuais e os membros anuais usam as bicicletas da Cyclistic de forma diferente. A partir desses insights, sua equipe criará uma nova estratégia de marketing para converter passageiros casuais em membros anuais. Mas, primeiro, os executivos da Cyclistic devem aprovar suas recomendações que, portanto, devem ser apoiadas com insights de dados convincentes e visualizações de dados profissionais.

## Sobre a empresa

  Em 2016, a Cyclistic lançou uma oferta bem-sucedida de compartilhamento de bicicletas. Desde então, o programa cresceu para uma frota de 5.824 bicicletas com rastreamento geográfico e bloqueio dentro de uma rede de 692 estações em Chicago. As bicicletas podem ser desbloqueadas em uma estação e devolvidas em qualquer outra estação do sistema a qualquer momento.

  Até agora, a estratégia de marketing da Cyclistic baseava-se na conscientização geral e no apelo a amplos segmentos de consumidores. Uma abordagem que ajudou a tornar essas coisas possíveis foi a flexibilidade de seus planos de preços: passes de viagem única, passes de dia inteiro e planos anuais. Os clientes que adquirem passes de viagem única ou de dia inteiro são chamados de passageiros casuais. Os clientes que adquirem planos anuais são membros Cyclistic.

  Os analistas financeiros da Cyclistic concluíram que os membros anuais são muito mais lucrativos do que os passageiros casuais. Embora a flexibilidade de preços ajude a Cyclistic a atrair mais clientes, Lily Moreno acredita que maximizar o número de membros anuais será a chave para o crescimento futuro. Em vez de criar uma campanha de marketing voltada para novos clientes, ela acredita que há uma boa chance de converter passageiros casuais em membros. Ela observa que os ciclistas casuais já estão cientes do programa Cyclistic e escolheram a Cyclistic para suas necessidades de mobilidade.

  A Lily estabeleceu um objetivo claro: criar estratégias de marketing destinadas a converter passageiros casuais em membros anuais. Para fazer isso, no entanto, a equipe de analistas de marketing precisa entender melhor como os membros anuais e os passageiros casuais diferem, por que os passageiros casuais iriam querer adquirir um plano e como a mídia digital poderia afetar suas táticas de marketing. A Lily e sua equipe estão interessados em analisar os dados históricos de trajetos de bicicleta da Cyclistic para identificar tendências.

## Perguntar
Três perguntas nortearão o futuro programa de marketing: \

    1. Como os membros anuais e os ciclistas casuais usam as bicicletas da Cyclistic de forma diferente?
    2. Por que os passageiros casuais iriam querer adquirir planos anuais da Cyclistic?
    3. Como a Cyclistic pode usar a mídia digital para influenciar os passageiros casuais a se tornarem membros?

# Início da Análise

Para começar a fazer a análise iremos precisar importar as bibliotecas necessárias,
além da importação dos dados ao qual faremos o trabalho. 
Lembrando que os dados eu obtive no site <> são referentes aos meses de maio de 2022 a abril 
de 2023.


```{r}
# Bibliotecas
library(readr)
library(ggplot2)
library(tidyr)
library(dplyr)
library(skimr)
library(janitor)
library(lubridate)
library(plyr)
```

```{r}
# Arquivos para a análise
mai_22 <- read_csv("~/Documentos/Analise de Dados/planilha_projeto_bike_google/202205-divvy-tripdata.csv")
jun_22 <- read_csv("~/Documentos/Analise de Dados/planilha_projeto_bike_google/202206-divvy-tripdata.csv")
jul_22 <- read_csv("~/Documentos/Analise de Dados/planilha_projeto_bike_google/202207-divvy-tripdata.csv")
ago_22 <- read_csv("~/Documentos/Analise de Dados/planilha_projeto_bike_google/202208-divvy-tripdata.csv")
set_22 <- read_csv("~/Documentos/Analise de Dados/planilha_projeto_bike_google/202209-divvy-publictripdata.csv")
out_22 <- read_csv("~/Documentos/Analise de Dados/planilha_projeto_bike_google/202210-divvy-tripdata.csv")
nov_22 <- read_csv("~/Documentos/Analise de Dados/planilha_projeto_bike_google/202211-divvy-tripdata.csv")
dez_22 <- read_csv("~/Documentos/Analise de Dados/planilha_projeto_bike_google/202212-divvy-tripdata.csv")
jan_23 <- read_csv("~/Documentos/Analise de Dados/planilha_projeto_bike_google/202301-divvy-tripdata.csv")
fev_23 <- read_csv("~/Documentos/Analise de Dados/planilha_projeto_bike_google/202302-divvy-tripdata.csv")
mar_23 <- read_csv("~/Documentos/Analise de Dados/planilha_projeto_bike_google/202303-divvy-tripdata.csv")
abr_23 <- read_csv("~/Documentos/Analise de Dados/planilha_projeto_bike_google/202304-divvy-tripdata.csv")

```

Após a importação, verifico os nomes das colunas para verificar se há as mesmas colunas em todas as planilhas

```{r}
# Verificar o nome de todas as colunas
colnames(mai_22)
colnames(jun_22)
colnames(jul_22)
colnames(ago_22)
colnames(set_22)
colnames(out_22)
colnames(nov_22)
colnames(dez_22)
colnames(jan_23)
colnames(fev_23)
colnames(mar_23)
colnames(abr_23)
```
Após verificar os nomes das colunas decido fazer um resumo de cada dataset.
```{r}
str(mai_22)
str(jun_22)
str(jul_22)
str(ago_22)
str(set_22)
str(out_22)
str(nov_22)
str(dez_22)
str(jan_23)
str(fev_23)
str(mar_23)
str(abr_23)
```

Percebendo que as colunas de todas as planilhas possuem  as mesmas características, decido unir tudo em um
único banco de dados.

```{r}
viagens <- rbind.fill(mai_22, jun_22, jul_22, ago_22, set_22, out_22, nov_22,
                        dez_22, jan_23, fev_23, mar_23, abr_23)
```
Pronto, criei o dataframe *viagens*. Agora que eu o possuo, com o intuito de economizar memória, decido remover
os outros, visto que não são necessário mais no momento.

```{r}
rm(mai_22, jun_22, jul_22, ago_22, set_22, out_22, nov_22, dez_22, jan_23, fev_23, mar_23, abr_23)
```
Perfeito.

Verificaremos o Dataset para confirmar se está certo, além de compreender um pouco mais como ele está.
```{r}
View(viagens)
```

Como existem algumas colunas que não serão utilizadas na minha análise, irei retirá-las, mas caso alguém deseje
no futuro utilizá-las conseguirá fazer modelagens interessantes.

```{r}
viagens <- viagens %>% select(-c(start_lat, start_lng, end_lat, end_lng))
```

Enquanto verificamos, existem alguns itens que seriam interessante acrescentar em uma nova coluna.

```{r}
viagens$data <- as.Date(viagens$started_at)
viagens$mes <- month(viagens$data, label = TRUE)
viagens$dia_da_semana <- weekdays(ymd(viagens$data))
```
Utilizei o comando acima por achar mais simples, mas alguns podem utilizar o comando **format(as.Date(dataframe$coluna), "%A")**. Fica a seu critério.

Agora criaremos uma coluna para calcular o tempo de uso das viagens de bicicleta.

```{r}
viagens$tempo_uso <- difftime(viagens$ended_at, viagens$started_at)
```

Precisamos de algumas informações extras para conseguir utilizar essa coluna a nosso bel prazer.
```{r}
is.factor(viagens$tempo_uso)
viagens$tempo_uso <- as.numeric(as.character(viagens$tempo_uso))
is.numeric(viagens$tempo_uso)
```

Agora iremos criar um novo dataset retirando os dados ruins.
```{r}
viagens_v2 <- viagens[!(viagens$start_station_name == "HQ QR" | viagens$tempo_uso <0),]
viagens_v2 <- na.omit(viagens_v2)
```

```{r}
viagens_v2$tempo_uso_minuto <- viagens_v2$tempo_uso / 60
```

```{r}
rm(viagens)
```

Ainda assim, percebi que a coluna **tempo_uso** está em segundos, creio que seja melhor trabalhar com ela em minutos. Então vamos modificar o dataset mais um pouco.


 Deste modo a coluna **tempo_uso** se torna obsoleta para a nossa análise, então iremos retirar ela também.
```{r}
viagens_v2 <- viagens_v2 %>% select(-c(tempo_uso))
```

Por fim transformaremos a coluna **mes** em character.

```{r}
viagens_v2$mes <- as.character(viagens_v2$mes)
```

Deste modo terminamos a limpeza dos dados, então decidi salvar o dataset em um arquivo csv, tanto para economia
de tempo quanto de memória.

```{r}
write_csv(viagens_v2, file = "viagens_bicicletas.csv")
```

## Análise Exploratória


Verificando se está tudo certo com o dataset.

```{r}
colnames(viagens_v2)
nrow(viagens_v2)
dim(viagens_v2)
head(viagens_v2)
str(viagens_v2)
summary(viagens_v2)
```
Verificando se está tudo certo nas colunas *member_casual*, *dia_da_semana* e *rideable_type*.
```{r}
table(viagens_v2$member_casual)
table(viagens_v2$rideable_type)
table(viagens_v2$dia_da_semana)
```

Os dias da semana e mês estão desorganizados, então iremos escolher uma ordem a ser seguida.
```{r}
viagens_v2$dia_da_semana <- ordered(viagens_v2$dia_da_semana, 
                                 levels = c("domingo", "segunda", "terça",
                                            "quarta", "quinta", "sexta", "sábado"))
viagens_v2$mes <- ordered(viagens_v2$mes, c("mai", "jun", "jul", "ago", "set",
                                                    "out", "nov", "dez", "jan", "fev",
                                                    "mar", "abr"))
```

Agora iremos fazer a modelagem dos dados.
 
## Member x Casual
Para a compreensão desta etapa é necessário a compreensão de como cada dado interage
entre si.

```{r}
frequencia <- (table(viagens_v2$member_casual) / sum(table(viagens_v2$member_casual))) * 100

estatistica_usuario <-data.frame(member_casual = names(frequencia), percentual = frequencia)

estatistica_usuario %>% ggplot(aes(x=member_casual, y= percentual.Freq, fill = member_casual)) + geom_col(position = "dodge") +labs(x="Tipo de Usuário", y="Percentual (%)", title = "Tipos de Usuários", subtitle = "Frequência dos tipos de ciclistas", hjust = 0.5) + theme(legend.position = "right") + theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) + guides(fill = guide_legend(title = "Tipo de Usuário"))

```
Percebemos que o índice de usuários que adiquirem planos é de aproximadamente 60% enquanto o casual é aproximadamente 40%.

```{r}
aggregate(viagens_v2$tempo_uso_minuto ~viagens_v2$member_casual, FUN = mean)
aggregate(viagens_v2$tempo_uso_minuto ~viagens_v2$member_casual, FUN = median)
aggregate(viagens_v2$tempo_uso_minuto ~viagens_v2$member_casual, FUN = max)
```

Criando uma função e analisando o gráfico da duração média de cada tipo de cliente
```{r}
usuario <- viagens_v2 %>% group_by(member_casual) %>% summarise(avg_duration = mean(tempo_uso_minuto))
```


```{r}
usuario %>%
  ggplot(mapping = aes(x= member_casual, y= avg_duration, fill = member_casual)) + 
  geom_col() + labs(x = "Tipo de usuário", y= "Duração média da viagem", title = "Duração média x Tipo de cliente", subtitle = "Duração média de cada viagem por cada tipo de usuário de bicicleta") + theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) + guides(fill = guide_legend(title = "Tipo de Usuário"))
```

Analisando as viagens aos longo do ano dos membros casuais e mensais ao longo do ano
```{r}
viagens_v2 %>% filter(member_casual == "casual") %>% group_by(member_casual, mes) %>% summarise(num_of_roads = n()) %>% ggplot(mapping = aes(x= mes, y=num_of_roads, fill= num_of_roads)) + geom_col() + scale_y_continuous(labels = scales::comma)
```

```{r}
viagens_v2 %>% filter(member_casual == "member") %>% group_by(member_casual, mes) %>% summarise(num_of_roads = n()) %>% ggplot(mapping = aes(x= mes, y=num_of_roads, fill= num_of_roads)) + geom_col()  + scale_y_continuous(labels = scales::comma)
```

Mas ao analisar a duração média, percebemos que o tempo de uso das bicicletas é bem diferente do esperado.
Os usuários casuais utilizam aproximadamente 31% a mais do que os membros. Deste modo podemos considerar que os membros utilizam as bicicletas para irem em locais mais perto do que os casuais. Assim, pode se levar a crer que os usuários com planos utilizam as bicicletas com um foco a ir ao trabalho, enquanto os casuais podem utilizar para lazer.


## Dia da semana
```{r}
aggregate(viagens_v2$tempo_uso_minuto ~viagens_v2$dia_da_semana + viagens_v2$member_casual, FUN = mean)
aggregate(viagens_v2$tempo_uso_minuto ~viagens_v2$dia_da_semana + viagens_v2$member_casual, FUN = max)
aggregate(viagens_v2$tempo_uso_minuto ~viagens_v2$dia_da_semana + viagens_v2$member_casual, FUN = median)

```
Analisando os tipos de viagens ao longo da semana

```{r}
dia <- viagens_v2 %>% group_by(dia_da_semana, member_casual) %>% 
  summarise(numero_passeio = n(), avg_duracao = mean(tempo_uso_minuto)) 

dia %>% ggplot(aes(x= dia_da_semana, y=numero_passeio, fill= member_casual)) +
  geom_bar(stat = "identity", position = "dodge") + labs(x= "Dia da semana", y= "Número de viagens", title = "Viagens x Dia da semana", subtitle = "Número de viagens por cada dia da semana") + theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) + guides(fill = guide_legend(title = "Tipo de Usuário")) + scale_y_continuous(labels = scales::comma)

```

Propoção diária das viagens por tipo de cliente
```{r}
dia_semana_total <- dia %>%
    group_by(dia_da_semana) %>%
    summarise(total_viagens_dia_semana = sum(numero_passeio))

```

```{r}
dia <- dia %>%
    left_join(dia_semana_total, by = "dia_da_semana") %>%
    mutate(proporcao_ajustada = paste0(round(numero_passeio / total_viagens_dia_semana * 100, 2), "%"))
```


```{r}
dia %>% ggplot(aes(x= dia_da_semana, y= avg_duracao, fill= member_casual)) + 
  geom_bar(stat = "identity", position = "dodge") + labs(x= "Dia da semana", y= "Duração média", title = "Duração média x Dia da semana", subtitle = "Duração média das viagens por cada dia da semana") + theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) + guides(fill = guide_legend(title = "Tipo de Usuário")) 
```

Percebe-se que o número de viagens aos fins de semana dos tipos de usuários são muito próximos, apesar que durante os dias de semana a quantidade de viagens do member é muito superior aos casuais. Enquanto isso, o tempo de viagem média nos mostra que os member usam no máximo aproximadamente 14 minutos enquanto o casual utiliza aproximadamente 20 minutos no mínimo.


## Tipos de bicicleta

```{r}
aggregate(viagens_v2$tempo_uso_minuto ~viagens_v2$rideable_type, FUN= mean)
aggregate(viagens_v2$tempo_uso_minuto ~viagens_v2$rideable_type, FUN= median)
aggregate(viagens_v2$tempo_uso_minuto ~viagens_v2$rideable_type, FUN= max)
aggregate(viagens_v2$tempo_uso_minuto ~viagens_v2$rideable_type, FUN= min)

```

```{r}
bicicleta <- viagens_v2 %>% group_by(rideable_type, member_casual) %>% 
  summarise(num_of_passeio = n(), avg_duration = mean(tempo_uso_minuto), tempo_total = sum(tempo_uso_minuto))
```
```{r}
bicicleta %>% 
  ggplot(mapping = aes(x= rideable_type, y= avg_duration, fill= member_casual)) + 
  geom_col(position = "dodge") + labs(x= "Tipo de bicicleta", y= "Duração média", title = "Duração média x Tipo de bicicleta", subtitle = "Duração média das viagens por tipo de bicicleta de cada tipo de usuário") + theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) + guides(fill = guide_legend("Tipo de Usuário"))
```

```{r}
bicicleta %>%
  ggplot(mapping = aes(x= rideable_type, y= num_of_passeio, fill = member_casual)) + 
  geom_col(position = "dodge") + labs(x= "Tipo de bicicleta", y= "Número de viagens", title = "Número de viagens x Tipo de bicicleta", subtitle = "Quantidade de viagens por tipo de bicicleta de cada tipo de usuário") + theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) + guides(fill = guide_legend("Tipo de Usuário"))

```

```{r}
total_trips <- sum(bicicleta$num_of_passeio)
total_duration <- sum(bicicleta$tempo_total)
total_avg_duration <- sum(bicicleta$avg_duration)
porc_trip <- bicicleta %>% mutate(proporcao_viagens = paste0(round(num_of_passeio / total_trips *100), "%"), proporção_tempo = paste0(round(tempo_total / total_duration *100), "%"), proporção_avg_duration = paste0(round(avg_duration /total_avg_duration *100), "%"))

```

```{r}
porc_trip
```

Com a análise percebemos os tipos de bicicletas mais utilizadas, mas também vemos que a bicicleta de carga (docked_bike) é o único tipo que não possui usuário member utilizando. Apesar dela possuir o menor número de viagens, possuindo aproximadamente 4% das viagens, percebemos que ela possui a maior média de duração da viagem (aproximadamente 43% do tempo médio total).

## Tipo de bicicleta x Dia da semana

```{r}
aggregate(viagens_v2$tempo_uso_minuto ~viagens_v2$dia_da_semana + viagens_v2$rideable_type, FUN = mean)
aggregate(viagens_v2$tempo_uso_minuto ~viagens_v2$dia_da_semana + viagens_v2$rideable_type, FUN = median)
aggregate(viagens_v2$tempo_uso_minuto ~viagens_v2$dia_da_semana + viagens_v2$rideable_type, FUN = max)

```

```{r}
tipo_semana <- viagens_v2 %>% group_by(rideable_type, dia_da_semana) %>% 
  summarise(number_of_rides = n(), avg_duration = mean(tempo_uso_minuto))

```

```{r}
tipo_semana %>%
  ggplot(mapping = aes(x= dia_da_semana, y= number_of_rides, fill = rideable_type)) + 
  geom_col(position = "dodge") + labs(x="Dia da semana", y="Número de viagens", title = "Número de viagens x Dia da semana", subtitle = "Número de viagens de cada tipo de bicicleta por dia da semana") + theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) + guides(fill = guide_legend(title = "Tipo de Bicicleta")) + scale_y_continuous(labels = scales::comma)
```

```{r}
tipo_semana %>%
  ggplot(mapping = aes(x= dia_da_semana, y= avg_duration, fill = rideable_type)) + 
  geom_col(position = "dodge")+ labs(x="Dia da semana", y="Duração média", title = "Duração média x Dia da semana", subtitle = "Duração média das viagens de cada tipo de bicicleta por dia da semana") + theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) + guides(fill = guide_legend(title = "Tipo de Bicicleta"))
```

Esta análise serve para reforçar que apesar da docked_bike possuir o menor número de viagens em qualquer dia da semana, o índice de tempo médio das viagens é superior a qualquer outro tipo de bicicleta.



## Mensal

```{r}
mensal <- viagens_v2 %>% group_by(mes, member_casual) %>% 
  summarise(num_of_roads = n(), avg_duration= mean(tempo_uso_minuto))
```

```{r}
mensal %>% 
  ggplot(aes(x=mes, y=num_of_roads, fill= num_of_roads)) + geom_col(position = "dodge") + labs(x= "Mês", y="Número de viagens", title = "Número de viagens x Mês", subtitle = "Número de viagens ao longo de cada mês") + theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) + guides(fill = guide_legend(title = "Número de viagens")) + scale_y_continuous(labels = scales::comma)

```

```{r}
mensal %>% 
  ggplot(aes(x=mes, y=num_of_roads, fill= member_casual)) + geom_col(position = "dodge") + labs(x= "Mês", y="Número de viagens", title = "Número de viagens x Mês", subtitle = "Número de viagens ao longo de cada mês") + theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) + guides(fill = guide_legend(title = "Número de viagens")) + scale_y_continuous(labels = scales::comma)

```

```{r}
mensal %>% 
  ggplot(aes(x=mes, y=avg_duration, fill= num_of_roads)) + geom_col(position = "dodge") + labs(x= "Mês", y="Duração média", title = "Duração média x Mês", subtitle = "Duração média das viagens ao longo de cada mês") + theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) + guides(fill = guide_legend(title = "Número de viagens"))

```

Percebemos que nos meses de Dezembro, Janeiro e Fevereiro o uso das bicicletas caem muito, enquanto nos meses Junho, Julho e Agosto é o pico da utilização das bicicletas. O que nos mostra ser necessário fazer uma análise das estações do ano para melhor compreensão.

## Estação do Ano

```{r}
viagens_v2 <- viagens_v2 %>% mutate(estacao = case_when(
  mes %in% c('jun', 'jul', 'ago') ~ "Verão",
  mes %in% c("set", "out", "nov") ~ "Outono",
  mes %in% c("dez", "jan", "fev") ~ "Inverno",
  mes %in% c("mar", "abr", "mai") ~"Primavera",
  TRUE ~ NA_character_))
```

```{r}
viagens_v2$estacao <- ordered(viagens_v2$estacao, level = c("Inverno", "Primavera", "Verão", "Outono"))
```

```{r}
aggregate(viagens_v2$tempo_uso_minuto ~viagens_v2$estacao + viagens_v2$rideable_type, FUN = mean)

```

```{r}
trimestre <- viagens_v2 %>% group_by(estacao, rideable_type, member_casual) %>% 
  summarise(number_of_rods= n(), average_duration = mean(tempo_uso_minuto))

```
```{r}
temporada <- trimestre %>% group_by(estacao) %>% summarise(numero_viagen = sum(number_of_rods))
temporada %>% mutate(proporção = paste0(round(numero_viagen / sum(numero_viagen)*100, 2), "%"))

```

```{r}
trimestre %>% ggplot(mapping = aes(x=estacao, y= number_of_rods, fill= estacao)) +
  geom_col(position = "dodge") + labs(x="Estação do Ano", y="Número de viagens", title = "Número de viagens x Estação", subtitle = "Número de viagens que ocorreram por estação do ano") + theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) + guides(fill = guide_legend(title = "Estação do Ano")) + scale_y_continuous(labels = scales::comma)
```

```{r}
trimestre %>% ggplot(mapping = aes(x=estacao, y= average_duration, fill= estacao)) +
  geom_col(position = "dodge") + labs(x="Estação do Ano", y="Duração Média", title = "Duração Média x Estação", subtitle = "Duração média das viagens que ocorreram por estação do ano") + theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) + guides(fill = guide_legend(title = "Estação do Ano"))

```

```{r}
trimestre %>% ggplot(mapping = aes(x=estacao, y= number_of_rods, fill= rideable_type)) + 
  geom_col(position = "dodge") + labs(x="Estação do Ano", y="Número de viagens", title = "Número de viagens x Estação", subtitle = "Número de viagens por tipo de bicicleta que ocorreram por estação do ano") + theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) + guides(fill = guide_legend(title = "Bicicleta")) + scale_y_continuous(labels = scales::comma)
```

```{r}
trimestre %>% ggplot(mapping = aes(x=estacao, y= average_duration, fill= rideable_type)) + 
  geom_col(position = "dodge") + labs(x="Estação do Ano", y="Duração Média", title = "Duração Média x Estação", subtitle = "Duração média das viagens dos tipos de bicicletas por estação do ano") + theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) + guides(fill = guide_legend(title = "Bicicleta"))
```

```{r}
trimestre %>% ggplot(mapping = aes(x=estacao, y= average_duration, fill= member_casual)) +
  geom_col(position = "dodge") + labs(x="Estação do Ano", y="Duração Média", title = "Duração Média x Estação", subtitle = "Duração média das viagens dos tipos de clientes por estação do ano") + theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) + guides(fill = guide_legend(title = "Usuário"))
```

```{r}
trimestre %>% ggplot(mapping = aes(x=estacao, y= number_of_rods, fill= member_casual)) +
  geom_col(position = "dodge") + labs(x="Estação do Ano", y="Número de viagens", title = "Número de viagens x Estação", subtitle = "Número de viagens por tipo de cliente que ocorreram em cada estação do ano") + theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) + guides(fill = guide_legend(title = "Usuário"))
```
```{r}
temporada <- trimestre %>% group_by(estacao, member_casual) %>% summarise(numero_viagen = sum(number_of_rods))

temporada %>% mutate(proporção = paste0(round(numero_viagen / sum(numero_viagen) * 100, 2), "%"))
```






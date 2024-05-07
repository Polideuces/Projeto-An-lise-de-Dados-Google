# Estudo de caso 
## Análise de dados do compartilhamento de bicicletas da Cyclistic
Autor: Cássio Lanna
[Dashboard] (URL)

## Índice
[1. Introdução] (#introdução)

[2. Tarefa de negócios] (#tarefa-de-negocios)

[3. Dados] (#dados)

[4. Processmento e Limpeza] (#processamento-e-limpeza)

[5. Análise e Visualização] (#análise-e-conclusão)

[6. Conclusão e Recomendação] (#conclusão-e-recomendação)

[7. Possíveis escolhas para análise mais aprofundada] (#possíveis-escolhas-para-uma-análise-mais-aprofundada)

## Introdução

Este estudo de caso foi elaborado pela Google em parceria com a Coursera, como projeto final para obtenção do [Certificado Profissional Google Data Analytics](https://www.coursera.org/professional-certificates/analise-de-dados-do-google). O cenário consiste na análise dos dados de demanda da empresa de compartilhamento de bicicletas Cyclistic.

A empresa oferta seu serviço de aluguel de bicicletas de duas formas: passes individuais chamados de ciclistas "casuais" e assinaturas anuais chamadas de ciclistas "membros". A empresa conta com  aproximadamente 6.000 bicicletas que circulam por meio de 600 estações nas ciclovias da cidade de Chicago, localizada no estado de Illinois, Estados Unidos.

Conquistar mais membros anuais é crucial para o crescimento sustentável da empresa, impulsionando a fidelização, a receita recorrente e fornecendo dados valiosos para otimizar estratégias de marketing.

##  Tarefa de negócios
       . Como os membros anuais e os ciclistas casuais usam as bicicletas da Cyclistic de forma diferente?
       . Por que os passageiros casuais iriam querer adquirir planos anuais da Cyclistic?
       . Como a Cyclistic pode usar a mídia digital para influenciar os passageiros casuais a se tornarem membros?
>**Objetivo**: Limpar, analisar e visualizar os dados para observar como os ciclistas casuais usam o aluguel de bicicletas de maneira diferente dos ciclistas associados anuais e obter insights.

##  Dados
* [Dados históricos](https://divvy-tripdata.s3.amazonaws.com/index.html) de viagens de ciclistas (de 2013 em diante) disponíveis em no formato **.csv**.
* **Intervalo dos dados da análise**: maio de 2022 a abril de 2023 (1,1 GB, descompactado);
* O conjunto de dados possui registros individuais de uso de bicicletas compartilháveis que constam de data e hora de início e término do passeio, latitude e longitude, informações da estação, tipo de bicicleta e tipo de ciclista (casual/membro).

## Processamento e Limpeza
* Os dados foram baixados para o HD local para manipulação e análise usando o **Rstudio**;
* Toda a **documentação e script** do trabalho está [aqui.] (URL)
* [**Dashboard**] (URL)
* Para auxiliar na análise, foram adicionadas
* Antes da limpeza, todo o dataset possuia  linhas.
* **Processo de limpeza:** No processo foram apagadas:
  * Linhas com nomes de estação inicial e final ausentes encontradas;
  * Outras colunas que não possuiam utilidade para esta análise;
* Valores de duração de viagem negativos, zerados e abaixo de 1.

>Após a limpeza e consolidação dos dados em uma tabela, foram retornadas 4.270.103 linhas para a análise.



## Análise e Visualização

Foram analisados os dados de viagem de aproximadamente 4.2 milhões de registros de passeio no conjunto de dados final. Para observar tendências diferenciadas entre o uso por usuários casuais e membros anuais, foram desenvolvidas visualizações diretamente no Rstudio.

### Distribuição percentual do total de passeios

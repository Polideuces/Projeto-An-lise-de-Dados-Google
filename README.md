# Estudo de caso 
## Análise de dados do compartilhamento de bicicletas da Cyclistic
Autor: Cássio Lanna

[Dashboard](https://public.tableau.com/views/Cyclist_17151992082560/Painel2?:language=pt-BR&:sid=&:display_count=n&:origin=viz_share_link)

## Índice
[1. Introdução](#introdução)

[2. Tarefa de negócios](#tarefa-de-negócios)

[3. Dados](#dados)

[4. Processmento e Limpeza](#processamento-e-limpeza)

[5. Análise e Visualização](#análise-e-conclusão)

[6. Conclusão e Recomendação](#conclusão-e-recomendação)

[7. Possíveis escolhas para análise mais aprofundada](#possíveis-escolhas-para-uma-análise-mais-aprofundada)

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
* Toda a **documentação e script** do trabalho está [aqui.]([URL](https://github.com/Polideuces/Projeto-Cyclist/blob/afe718b4fe13b270ca9eac0dafec534c49cecf41/Documento%20em%20R/projeto_cyclist.R))
* [**Dashboard**]([URL](https://github.com/lannacassio/Projeto-Cyclist/blob/main/README.md))
* Para auxiliar na análise, foram adicionadas seis colunas.
* Antes da limpeza, todo o dataset possuia  linhas 5.859.061 linas.
* **Processo de limpeza:** No processo foram apagadas:
  * Linhas com nomes de estação inicial e final ausentes encontradas;
  * Outras colunas que não possuiam utilidade para esta análise;
  * Valores de duração de viagem negativos.

>Após a limpeza e consolidação dos dados em uma tabela, foram retornadas 4.533.929 linhas para a análise.



## Análise e Visualização

Foram analisados os dados de viagem de aproximadamente 4.2 milhões de registros de passeio no conjunto de dados final. Para observar tendências diferenciadas entre o uso por usuários casuais e membros anuais, foram desenvolvidas visualizações diretamente no Rstudio.

### Distribuição percentual do total de passeios

</head>
<body>
       <table>
              <tr>
                     <td><img src= "https://github.com/Polideuces/Projeto-Cyclist/blob/6014986b6922eaffee374909cacd3b3e0edda6b2/Graficos/frequencia_usuario.png"></td>            
                     <td><img src= "https://github.com/Polideuces/Projeto-Cyclist/blob/6014986b6922eaffee374909cacd3b3e0edda6b2/Graficos/dura%C3%A7%C3%A3o_media_usuario.png"></td>
              </tr>
       </table>
</body>
</html>
               



**Percepções**

* Aproximadamente 40% das viagens foram feitas por usuários casuis;
  
* Aproximadamente 60% das viagens feitas foram por usuários member;
  
*  Apesar da demanda ser maior de ciclistas membros, tem-se que a utilização por tempo médio de cada viagem  nos mostra que os usuários casuais utilizam aproximadamente 31% a mais do que os membros. Deste modo podemos considerar que os membros utilizam as bicicletas para irem em locais mais perto do que os casuais.
  
* Considerando as informações anteriores pode levar a crer que os usuários com planos utilizam as bicicletas com um foco a ir ao trabalho, enquanto os casuais podem utilizar para lazer.

### Distribuição semanal dos passeios por tipo de usuário

<img src= "https://github.com/Polideuces/Projeto-Cyclist/blob/6014986b6922eaffee374909cacd3b3e0edda6b2/Graficos/viagens_dia_semana.png" alt="" width= "50%">

**Percepções**

*  Evidentemente o pico do usuários casuais ocorre aos finais de semana, ao contrário dos membros casuais que se matem estáveis.
  
*  Os usuários casuais deixam para utilizarem mais as bicicletas aos finais de semana, possuindo um aumento de até 77,58% em comparação aos dias de semana, podendo acreditar utilizarem para o lazer.
  
*  Os ususários member possuem uma queda aos fins de semana, sendo o pico no meio da semana e uma queda de até aproximadamente 20,01% aos fins de semana.


### Distribuição do uso dos tipos de bicicleta

</head>
<body>
       <table>
              <tr>
                     <td><img src= "https://github.com/Polideuces/Projeto-Cyclist/blob/6014986b6922eaffee374909cacd3b3e0edda6b2/Graficos/bicicleta_dura%C3%A7%C3%A3o_media.png"></td>     
                     <td><img src= "https://github.com/Polideuces/Projeto-Cyclist/blob/6014986b6922eaffee374909cacd3b3e0edda6b2/Graficos/tipo_bicicleta_viagens.png"></td>
              </tr>
       </table>
</body>
</html>






**Percepsões** 

* Percebe-se que a docked_bike é o único tipo de bicicleta que não possui usuário member utilizando.
  
* A docked_bike possui o menor número de viagens, possuindo aproximadamente 4% das viagens.
  
* A doked_bike possui a maior média de duração da viagem (aproximadamente 43% do tempo médio total).
  
* A classic_bike é um tipo de bicicleta muito visada para as viagens, possuindo quase 59% das viagens, sendo aproximadamente 20% os casuais e 39% os member.

### Distribuição mensal

</head>
<body>
       <table>
              <tr>
                     <td><img src= "https://github.com/Polideuces/Projeto-Cyclist/blob/ee75f368d9b7b4dd7d96ae6919f0d2d891a272e3/Graficos/mensal.png"></td>   
                     <td><img src= "https://github.com/Polideuces/Projeto-Cyclist/blob/ee75f368d9b7b4dd7d96ae6919f0d2d891a272e3/Graficos/usuario_mensal.png"></td>
              </tr>
       </table>
</body>
</html>






**Percepsões** 

* Meses de Dezembro a Fevereiro há um decaimento de usuários, sendo um decaimento de aproximadamente 78,93% em comparação de julho e dezembro.
  
* Os meses de Junho a Agosto representam aproximadamente 41% das viagens.
  
* A visualização torna perceptível os meses que estão em cada estação do ano. 

### Distribuição por Estação do Ano

</head>
<body>
       <table>
              <tr>
                     <td><img src= "https://github.com/Polideuces/Projeto-Cyclist/blob/ee75f368d9b7b4dd7d96ae6919f0d2d891a272e3/Graficos/viagens_estacao_ano.png"></td>     
                     <td><img src= "https://github.com/Polideuces/Projeto-Cyclist/blob/ee75f368d9b7b4dd7d96ae6919f0d2d891a272e3/Graficos/viagens_clientes_estacao.png"></td>
              </tr>
       </table>
</body>
</html>





**Percepsões** 

* As viagens no Inverno representam 9,56% de todas as viagens,  Primavera 22,66%, Verão 41,21% e Outono 26,58%.
  
*  Durante o inverno há a maior caída dos membros casuais, chegando até aproximadamente 2,07% do total de viagens durante todo o ano. 


# Conclusão e Recomendação

* Uma observação, os usuários casuais utilizam as bicicletas por mais tempo do que os members, podem ser um indicativo que uzem-nas para lazer ou turismo, enquanto os members utilizam com um foco para deslocamento para trabalhos ou a rotina diária.
  
*  Pode-se fazer marketing em locais de lazer ou pontos turísticos, como: parques, teatros, cinema, academia, restaurantes, hotéis.
  
* Como os usuários casuais utilizam a bicicleta por longo período de tempo, pode-se pensar em planos com melhor custo/benefício para a categoria.
  
* Fazer um plano especial para os usuários da docked_bike, com intuito de fazê-los migrar para os usuários member.
  
* No inverno pode-se fazer promoções nos planos de cada categoria e criar um incentivo quando as temperaturas estiverem mais amenas.
  
* Notificações nas redes sociais.
  
* Fazer incentivos nos dias de semana ou em épocas de retrocesso.

#  Possíveis escolhas para análise mais aprofundada

Para uma análise mais profunda e detalhada seria ideal algumas informações: 

* Informar o preço para aluguel de bicicleta e os planos.
  
* Analisar feriados regionais e nacionais para verificar a influência.
  
* Conseguir informação da idade do público.
  
* Permitir que os usuários avaliem a empresa e darem feedback.
  
* Analisar o nível de crime (assalto, agressões, homicídio, vandalismo, acidente de carro) na cidade ou nas regiões que se encontram as bicicletas.
  
* Informar se um cliente renovou o pacote, se transferiu do casual para o member ou se o pacote venceu.

* Verificar o número de viagens que ocorrem por hora em cada semana ou mês, para ter informação se nos horários de pico possui bicicleta vaga ou não.





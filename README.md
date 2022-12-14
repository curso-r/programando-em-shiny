
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Boas-vindas!

Este é um livro em desenvolvimento. Toda contribuição, seja correção de
erros ortográficos ou sugestões de novos conteúdos, será bem-vinda.

O conteúdo aqui presente se destina a:

-   pessoas que programam em linguagem R e gostariam de começar a
    programar em Shiny;

-   pessoas que programam em Shiny e gostariam de se aprofundar no
    conceito de reatividade;

-   pessoas que programam em Shiny e gostariam de aprender a
    personalizar a interface de seus aplicativos.

## O que é Shiny?

Shiny é um framework em linguagem R para a criação de aplicativos web.
Por não exigir conhecimento prévio de HTML, CSS e JavaScript, ele
democratiza o acesso a essa área de desenvolvimento, permitindo a
criação de aplicativos bonitos e complexos a partir de um script R.

## Por que aprender Shiny?

Por ser gratuito e por não exigir de largada conhecimento em
desenvolvimento Web, o framework Shiny vem sendo cada vez mais utilizado
por empresas e por órgãos do governo para acomodar painéis analíticos ou
para comunicar resultados de maneira interativa e dinâmica. Programar em
Shiny se tornou um grande diferencial para cientistas de dados.

Nas universidades, o Shiny já é uma poderosa ferramenta de ensino, que
substitui apresentações de dezenas de slides por apenas uma única tela
interativa. Também é muito útil para a explicação de conceitos
estatísticos, além de incentivar estudantes a programar. Na pesquisa, o
Shiny facilita a colaboração entre cientistas de diferentes áreas e é
uma excelente alternativa para aumentar e melhorar a comunicação
científica.

## Quais são os limites do Shiny?

O Shiny fornece uma estrutura para gerarmos código HTML a partir de
funções em R. Também possui uma base de JavaScript e CSS para deixar os
aplicativos funcionais e com um visual satisfatório. Além disso, podemos
utilizar por trás todo o poderio de análise de dados que o R e seus
pacotes fornecem. Com esses elementos, já conseguimos construir qualquer
tipo de layout e lógica interna.

Contudo, o grande poder do Shiny está em não limitar as possibilidades
apenas ao que foi feito pelos desenvolvedores do pacote[^1]. Existem
vários outros pacotes criados pela comunidade que trazem mais elementos
visuais e funcionais para o Shiny, diminuindo ainda mais a necessidade
de conhecermos HTML, CSS e JavaScript. E, se você tem conhecimento
dessas linguagens, o céu é o limite! É muito simples incluir *tags*
HTML, folhas de estilo CSS e suas próprias funções JavaScript em um
aplicativo Shiny.

## O que você vai aprender neste livro?

Por possuir um paradigma de programação diferente do que estamos
acostumados no R, o Shiny não é o assunto mais indicado para quem está
começando a estudar a linguagem. Se você é uma pessoa iniciante em R,
recomendamos ficar bem confortável com alguns conceitos base antes de
embarcar no Shiny.

Em específico, este livro assume que você já tem conhecimento de
construção de funções, do operador *pipe* (`%>%` ou `|>`) e dos
principais pacotes do tidyverse (`readr`, `dplyr`, `tidyr`,`ggplot2`,
`stringr` e `lubridate`). Se esses temas não são familiares para você,
indicamos a leitura do livro [Ciência de Dados em
R](https://livro.curso-r.com/) antes de prosseguir.

Se você já programa em R e gostaria de começar a programar em Shiny,
você deve iniciar a leitura pela Parte 1. Você irá aprender,

-   como construir interfaces de usuário (UI);

-   como construir a lógica interna do app (server);

-   o que é e como lidar com a reatividade;

-   aplicar alguns tipos de layout ao seu app;

-   como utilizar *htmlwidgets*.

Se você já programa em Shiny e gostaria de se aprofundar no tema, você
pode iniciar na Parte 2. A partir desse ponto, vamos

-   utilizar módulos e o framework `golem` para organizar a construção
    de aplicativos complexos;

-   aprender uma base de HTML, CSS e JavaScript para começar a
    desenvolver seu próprio layout e funcionalidades;

-   explorar problemas complexos de reatividade para permitir interações
    ainda mais finas entre o usuário e o aplicativo.

## Como tirar o melhor proveito deste livro

Falar sobre Shiny em texto um grande desafio. A maior parte dos
resultados que vamos apresentar são interativos e dependem de um
servidor para funcionar, o que torna difícil descrevê-los ou
representá-los com imagens.

Deixamos alguns poucos aplicativos utilizados como exemplo neste livro
online[^2]. Sempre que disponível, recomendamos acessar o link e
interagir com o app.

No restante dos casos, deixamos disponível junto ao texto o código
completo do app, que você pode copiar e colar no R para rodar o
aplicativo. Recomendamos que você faça isso para todos os exemplos deste
tipo, sempre fazendo o exercício de analisar qual parte do código gera
cada parte do app.

## O que eu preciso para começar a aprender Shiny?

Antes de mais nada, participe das comunidades! Compartilhe seu
desenvolvimento. Poste seus avanços nas redes sociais e compartilhe suas
dúvidas em fóruns. *You’ll never walk alone*[^3].

-   [Comunidade
    RLadies](https://benubah.github.io/r-community-explorer/rladies.html)
-   [Fórum de dúvidas da Curso-R](https://discourse.curso-r.com/)
-   [AI inclusive](https://www.ai-inclusive.org/)
-   [Grupo Shiny Brasil no Telegram](https://t.me/+10xVIRZ7aek1NGZh)
-   [Grupo R Brasil no Telegram](https://t.me/rbrasiloficial)

Você também precisará:

-   conhecimento básico de R (ver seção anterior);
-   computador com últimas versões do
    [R](The%20Comprehensive%20R%20Archive%20Networkcran.r-project.org) e
    do [RStudio](https://rstudio.com/products/rstudio/download/)
    instaladas;
-   acesso à internet.

[^1]: O que já é muita coisa! Veja mais em <https://shiny.rstudio.com/>.

[^2]: Infelizmente seria muito trabalhoso e caro fazer isso com todos.

[^3]: *Você nunca andará sozinha/sozinho*, lema do Liverpool Football Club, um
    dos times mais populares da Inglaterra. A frase teve origem na
    música de mesmo nome composta por Richard Rodgers e Oscar
    Hammerstein em 1945, considerada hino do clube inglês.

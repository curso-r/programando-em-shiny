library(shiny)

ui <- fluidPage(
  h1("JavaScript", align = "center"),
  hr(),
  selectInput(
    inputId = "cor_do_texto",
    label = "Selecione a cor do texto",
    choices = c("black", "red", "orange", "purple", "blue", "green")
  ),
  br(),
  p("JavaScript (frequentemente abreviado como JS) é uma linguagem de
    programação interpretada estruturada, de script em alto nível com tipagem
    dinâmica fraca e multiparadigma (protótipos, orientado a objeto,
    imperativo e funcional). Juntamente com HTML e CSS, o JavaScript é
    uma das três principais tecnologias da World Wide Web. JavaScript
    permite páginas da Web interativas e, portanto, é uma parte essencial
    dos aplicativos da web. A grande maioria dos sites usa, e todos os
    principais navegadores têm um mecanismo JavaScript dedicado para
    executá-lo."),
  p("É atualmente a principal linguagem para programação client-side em
    navegadores web. É também bastante utilizada do lado do servidor através
    de ambientes como o node.js."),
  tags$script(src = "script.js")
)

server <- function(input, output, session) {

}

shinyApp(ui, server)

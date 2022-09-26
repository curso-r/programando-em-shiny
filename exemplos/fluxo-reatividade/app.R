library(shiny)

ui <- fluidPage(
  textInput("nome", "Seu nome"),
  textOutput("saudacao")
)

server <- function(input, output, session) {
  renderText({
    glue::glue("Olá {input$nome}! ")
  })
}

shinyApp(ui, server)

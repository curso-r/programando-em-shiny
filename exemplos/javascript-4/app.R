library(shiny)

ui <- fluidPage(
  tags$script(src = "script.js"),
  textOutput("mensagem")
)

server <- function(input, output, session) {

  output$mensagem <- renderText({
    print(input$browser)
    glue::glue("Olá! Você está usando o navegador {input$browser}!")
  })

}

shinyApp(ui, server)

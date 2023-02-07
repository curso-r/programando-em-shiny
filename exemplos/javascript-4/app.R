library(shiny)

ui <- fluidPage(
  tags$script(src = "script.js"),
  textOutput("ola")
)

server <- function(input, output, session) {

  output$ola <- renderText({
    print(input$browser)
    glue::glue("Olá! Você está usando o navegador {input$browser}!")
  })

}

shinyApp(ui, server)

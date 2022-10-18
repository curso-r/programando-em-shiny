dispersao_ui <- function(id) {
  ns <- NS(id)
  tagList(
    selectInput(
      inputId = ns("variavel_x"),
      label = "Selecione uma variável",
      choices = names(mtcars)
    ),
    selectInput(
      inputId = ns("variavel_y"),
      label = "Selecione uma variável",
      choices = names(mtcars)
    ),
    br(),
    plotOutput(ns("grafico"))
  )
}

dispersao_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$grafico <- renderPlot({
      plot(x = mtcars[[input$variavel_x]], y = mtcars[[input$variavel_y]])
    })
  })
}

library(shiny)

ui <- fluidPage(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
  ),
  shinyWidgets::useShinydashboard(),
  titlePanel("Usando tooltips"),
  sidebarLayout(
    sidebarPanel(
      tippy::with_tippy(
        numericInput(
          "tamanho",
          label = "Selecione o tamanho da amostra",
          value = 1000,
          step = 1000
        ),
        tooltip = "Amostra de uma distribuição Normal com média 0 e variância 100."
      )
    ),
    mainPanel(
      fluidRow(
        column(
          width = 4,
          div(
            class = "valuebox-tip",
            shinydashboard::valueBoxOutput("valor_1", width = 12)
          )
        ),
        column(
          width = 4,
          div(
            class = "valuebox-tip",
            shinydashboard::valueBoxOutput("valor_2", width = 12)
          )
        ),
        column(
          width = 4,
          div(
            class = "valuebox-tip",
            shinydashboard::valueBoxOutput("valor_3", width = 12)
          )
        ),
        column(
          width = 12,
          plotOutput("grafico")
        ),
        tippy::tippy_class(
          "valuebox-tip",
          content = "Você precisa importar o css do pacote shinydashboard se quiser usar valueBoxes fora do shinydashboard.",
          arrow = TRUE,
          placement = "left"
        )
      )
    )
  )
)

server <- function(input, output, session) {

  amostra <- reactive(rnorm(input$tamanho, sd = 10))

  output$valor_1 <- shinydashboard::renderValueBox({
    shinydashboard::valueBox(
      value = round(mean(amostra()), 1),
      subtitle = "Média dos valores",
      icon = icon("info-circle")
    )
  })

  output$valor_2 <- shinydashboard::renderValueBox({
    shinydashboard::valueBox(
      value = round(var(amostra()), 1),
      subtitle = "Variância dos valores",
      icon = icon("info-circle")
    )
  })

  output$valor_3 <- shinydashboard::renderValueBox({
    shinydashboard::valueBox(
      value = round(sd(amostra()), 1),
      subtitle = "Desvio-padrão dos valores",
      icon = icon("info-circle")
    )
  })

  output$grafico <- renderPlot(hist(amostra()))

}

shinyApp(ui, server)

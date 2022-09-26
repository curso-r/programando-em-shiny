library(shiny)
library(dplyr)
library(ggplot2)

cetesb <- readr::read_rds(here::here("cetesb/cetesb.rds"))

ui <- fluidPage(
  titlePanel("Análise da base de dados da cetesb"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "estacao",
        label = "Selecione a estação",
        choices = sort(unique(cetesb$estacao_cetesb))
      ),
      selectInput(
        inputId = "poluente",
        label = "Selecione o poluente",
        choices = c("Carregando" = "")
      )
    ),
    mainPanel(
      plotOutput("grafico")
    )
  )
)

server <- function(input, output, session) {

  gatilho <- reactiveVal(0)

  observeEvent(input$estacao, {
    poluentes <- cetesb |>
      filter(estacao_cetesb %in% input$estacao) |>
      pull(poluente) |>
      unique() |>
      sort()

    if(!is.null(input$poluente) & input$poluente == poluentes[1]) {
      gatilho(gatilho() + 1)
    }

    updateSelectInput(
      inputId = "poluente",
      choices = poluentes
    )
  })

  output$grafico <- renderPlot({
    req(input$poluente)
    print(input$poluente)
    gatilho()
    cetesb |>
      filter(
        estacao_cetesb == isolate(input$estacao),
        poluente == input$poluente
      ) |>
      ggplot(aes(x = data, y = concentracao)) +
      geom_line()
  })

}

shinyApp(ui, server)

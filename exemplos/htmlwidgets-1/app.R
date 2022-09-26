library(shiny)
library(dplyr)
library(ggplot2)

cetesb <- readr::read_rds("cetesb.rds")

ui <- fluidPage(
  titlePanel("htmlwidgets"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        "estacao",
        label = "Selecione uma estação",
        choices = sort(unique(cetesb$estacao_cetesb))
      ),
      selectInput(
        "poluente",
        label = "Selecione um poluente",
        choices = c("Carregando..." = "")
      ),
      dateRangeInput(
        "periodo",
        label = "Selecione um período",
        start = min(cetesb$data),
        end = max(cetesb$data),
        min = min(cetesb$data),
        max = max(cetesb$data)
      ),
      actionButton("botao", "Gerar visualizações")
    ),
    mainPanel(
      fluidRow(
        column(
          width = 6,
          h4("Top 10 dias com maiores concentrações médias"),
          reactable::reactableOutput("tabela")
        ),
        column(
          width = 6,
          h4("Localização da estação"),
          leaflet::leafletOutput("mapa")

        )
      ),
      br(),
      fluidRow(
        column(
          width = 12,
          h4("Concentração média mensal"),
          plotly::plotlyOutput("grafico")
        )
      )
    )
  )
)

server <- function(input, output, session) {

  observe({
    poluentes <- cetesb |>
      filter(estacao_cetesb == input$estacao) |>
      pull(poluente) |>
      unique() |>
      sort()

    updateSelectInput(
      session,
      "poluente",
      choices = poluentes
    )
  })

  cetesb_filtrada <- eventReactive(input$botao, {
    req(input$poluente)
    cetesb |>
      filter(
        estacao_cetesb == input$estacao,
        poluente == input$poluente,
        data >= input$periodo[1],
        data <= input$periodo[2]
      )
  })

  output$tabela <- reactable::renderReactable({
    cetesb_filtrada() |>
      group_by(data) |>
      summarise(
        concentracao_media = mean(concentracao, na.rm = TRUE)
      ) |>
      mutate(
        concentracao_media = round(concentracao_media, 2),
        data = format(data, "%d/%m/%Y")
      ) |>
      slice_max(concentracao_media, n = 10) |>
      reactable::reactable(
        sortable = FALSE,
        columns = list(
          data = reactable::colDef(
            name = "Data"
          ),
          concentracao_media = reactable::colDef(
            name = "Concentração média"
          )
        )
      )
  })

  output$mapa <- leaflet::renderLeaflet({
    cetesb_filtrada() |>
      distinct(estacao_cetesb, long, lat) |>
      leaflet::leaflet() |>
      leaflet::addTiles() |>
      leaflet::addMarkers(
        lng = ~long,
        lat = ~lat,
        label = ~estacao_cetesb
      )
  })

  output$grafico <- plotly::renderPlotly({
    p <- cetesb_filtrada() |>
      mutate(
        mes_ano = lubridate::make_date(
          year = lubridate::year(data),
          month = lubridate::month(data),
          day = 1
        )
      ) |>
      group_by(mes_ano) |>
      summarise(concentracao = mean(concentracao, na.rm = TRUE)) |>
      ggplot(aes(x = mes_ano, y = concentracao)) +
      geom_line()

    plotly::ggplotly(p)
  })


}

shinyApp(ui, server)

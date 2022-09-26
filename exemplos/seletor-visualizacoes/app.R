library(shiny)
library(ggplot2)

ui <- fluidPage(
  fluidRow(
    column(
      width = 12,
      h1("App com seletor de visualizações")
    )
  ),
  br(),
  fluidRow(
    column(
      offset = 1,
      width = 11,
      shinyWidgets::radioGroupButtons(
        inputId = "vis_escolhida",
        label = "",
        choiceValues = c("barras", "linhas", "tabela"),
        choiceNames = list(
          icon("bar-chart"),
          icon("line-chart"),
          icon("table")
        ),
        size = "lg",
        selected = "barras"
      )
    )
  ),
  br(),
  fluidRow(
    column(
      width = 12,
      uiOutput("vis")
    )
  )
)

server <- function(input, output, session) {

  output$vis <- renderUI({
    if (input$vis_escolhida %in% c("barras", "linhas")) {
      plotOutput("grafico")
    } else if (input$vis_escolhida == "tabela") {
      reactable::reactableOutput("tabela")
    }
  })

  tab <- brasileirao::matches |>
    dplyr::filter(
      score != "x",
      season %in% 2006:2020
    ) |>
    tidyr::separate(
      score,
      c("gols_casa", "gols_visitante"),
      sep = "x",
      convert = TRUE
    ) |>
    dplyr::mutate(
      gols = gols_casa + gols_visitante
    ) |>
    dplyr::group_by(season) |>
    dplyr::summarise(gols = sum(gols))

  output$grafico <- renderPlot({

    grafico_base <- tab |>
      ggplot(aes(x = season, y = gols)) +
      labs(x = "Temporada", y = "Número de gols") +
      theme_minimal() +
      ggtitle("Número de gols do Brasileirão por temporada")

    if (input$vis_escolhida == "linhas") {
      grafico_base +
        geom_line(color = "dark green")
    } else if (input$vis_escolhida == "barras") {
      grafico_base +
        geom_col(width = 0.5, fill = "dark green")
    }
  })

  output$tabela <- reactable::renderReactable({
    tab |>
      reactable::reactable(
        fullWidth = FALSE,
        columns = list(
          season = reactable::colDef(
            name = "Temporada"
          ),
          gols = reactable::colDef(
            name = "Número de gols"
          )
        )
      )
  })
}

shinyApp(ui, server)

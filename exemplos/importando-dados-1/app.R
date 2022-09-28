library(shiny)

link <- "https://raw.githubusercontent.com/williamorim/brasileirao/master/data-raw/csv/matches.csv"

dados <- readr::read_csv(link)

ui <- fluidPage(
  titlePanel("Últimos 10 jogos do time"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        "time",
        label = "Selecione um time",
        choices = unique(dados$home)
      )
    ),
    mainPanel(
      tableOutput("tabela")
    )
  )
)

server <- function(input, output, session) {

  output$tabela <- renderTable({
    dados |>
      dplyr::filter(
        score != "x",
        home == input$time | away == input$time
      ) |>
      dplyr::slice_max(order_by = date, n = 10) |>
      dplyr::mutate(
        date = format(date, "%d/%m/%Y")
      ) |>
      dplyr::select(date, home, score, away)
  })

}

shinyApp(ui, server)

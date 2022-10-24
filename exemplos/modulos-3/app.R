# Código do módulo

mod_filtro_ui <- function(id) {
  ns <- NS(id)
  fluidRow(
    column(
      width = 4,
      selectInput(
        inputId = ns("cyl"),
        label = "Número de cilindros",
        choices = sort(unique(mtcars$cyl)),
        multiple = TRUE,
        selected = unique(mtcars$cyl)
      )
    ),
    column(
      width = 4,
      selectInput(
        inputId = ns("am"),
        label = "Transmissão",
        choices = c("Automática" = 0, "Manual" = 1),
        multiple = TRUE,
        selected = c(0, 1)
      )
    ),
    column(
      width = 4,
      selectInput(
        inputId = ns("gear"),
        label = "Número de marchas",
        choices = sort(unique(mtcars$gear)),
        multiple = TRUE,
        selected = unique(mtcars$gear)
      )
    )
  )
}

mod_filtro_server <- function(id, dados) {
  moduleServer(id, function(input, output, session) {

    base_filtrada <- reactive({
      mtcars |>
        dplyr::filter(
          cyl %in% input$cyl,
          am %in% input$am,
          gear %in% input$gear,
        )
    })

    return(base_filtrada)

  })
}

# Código do app


library(shiny)

ui <- fluidPage(
  h2("Filtros"),
  mod_filtro_ui("mod_filtro"),
  hr(),
  tableOutput("tabela")
)

server <- function(input, output, session) {

  base_filtrada <- mod_filtro_server("mod_filtro")

  output$tabela <- renderTable({
    base_filtrada() |>
      tibble::rownames_to_column(var = "modelo")
  })

}

shinyApp(ui, server)




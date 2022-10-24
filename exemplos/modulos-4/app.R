# ESSE EXEMPLO NÃO É REPRODUTÍVEL

mod_pagina1_ui <- function(id) {
  ns <- NS(id)
  tagList(
    titlePanel("Página 1"),
    mod_filtros_ui(ns("mod_filtros")),
    # ui da página 1
  )
}

mod_pagina1_server <- function(id) {
  moduleServer(id, function(input, output, session) {

    dados_filtrados <- mod_filtros_server("mod_filtros")

    # server da página 1

  })
}

mod_filtros_ui <- function(id) {
  ns <- NS(id)
  tagList(
    fluidRow(
      shinydashboard::box(
        title = "Filtros",
        # UI dos filtros
      )
    )
  )
}

mod_filtros_server <- function(id) {
  moduleServer(id, function(input, output, session) {

    base_filtrada <- reactive({
      # filtro da base conforme as opções escolhidas na UI
    })

    return(base_filtrada)

  })
}


library(shiny)

ui <- fluidPage(
  DT::dataTableOutput("tabela")
)

# server

server <- function(input, output, server) {

  tabela_atual <- reactiveVal(mtcars)

  output$tabela <- DT::renderDataTable({
    mtcars |>
      DT::datatable(editable = TRUE)
  })

  proxy <- DT::dataTableProxy("tabela")

  observeEvent(input$tabela_cell_edit, {

    tab_atualizada <- DT::editData(
      tabela_atual(),
      input$tabela_cell_edit
    )

    tabela_atual(tab_atualizada)

    DT::replaceData(
      proxy,
      tab_atualizada
    )

  })
}

shinyApp(ui, server)

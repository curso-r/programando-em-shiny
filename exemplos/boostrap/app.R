library(shiny)

ui <- fluidPage(
  fluidRow(
    column(
      width = 8,
      offset = 2,
      h1("Esse é o título do meu app!", align = "center")
    ),
    column(
      width = 2,
      img(src = "logo.png", width = "100%")
    )
  ),
  hr(),
  h3("Sobre"),
  fluidRow(
    column(
      width = 6,
      p("Lorem ipsum", tags$em("dolor sit amet", .noWS = "after"), ", consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
    ),
    column(
      width = 6,
      p(strong("Lorem ipsum dolor"), "sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
    )
  ),
  hr(),
  fluidRow(
    column(
      width = 6,
      offset = 3,
      img(src = "logo.png", width = "100%")
    )
  )
)

server <- function(input, output, session) {

}

shinyApp(ui, server)

library(shiny)
library(shinyWidgets)
setwd("~/Desktop/Fall Quarter/PPHA-30536/Week4/shiny-plot-weiluj")

ui <- fluidPage(
  setBackgroundColor(color = "#FFF5EE"),
  fluidRow(
    column(width = 12,
           align = "center",
           tags$h1("Welcome to UChicago!"),
           tags$h5("——aka where all fun comes to die\n:)"),
           tags$hr()
           )
  ),
  fluidRow(
    column(width = 3,
           offset = 2,
           align = "center",
           tags$em(tags$h4("Virtual Tour")),
           ),
    column(width = 4,
           offset = 1,
           align = "center",
           tags$h4("PPHA 30536 Winter 2022")),
  ),
  fluidRow(
    column(width = 4,
           align = "center",
           offset = 4,
           selectInput(inputId = "building",
                       label = "Please pick a building",
                       choices = c("Keller Center", "Rockefeller Chapel",
                                   "Mansueto Library", "Logan Center",
                                   "Law School", "Saieh Hall",
                                   "Hogwarts", "Hyde Park View")
                       )
           )
    ),
  fluidRow(
    column(width = 12,
           align = "center",
           imageOutput(outputId = "building")
           )
    )
)


server <- function(input, output) {
  output$building <- renderImage({
    if (input$building == "Keller Center") {
      src <- "keller.jpg"
    } else if (input$building == "Rockefeller Chapel") {
      src <- "rockefeller.jpg"
    } else if (input$building == "Mansueto Library") {
      src <- "mansueto.jpg"
    } else if(input$building == "Logan Center") {
      src <- "logan.jpg"
    } else if(input$building == "Law School") {
      src <- "law.jpg"
    } else if(input$building == "Saieh Hall") {
      src <- "saieh.jpg"
    } else if(input$building == "Hogwarts") {
      src <- "harper.jpg"
    } else if(input$building == "Hyde Park View") {
      src <- "hyde park.jpg"
    }
    list(src = src,
         width = "60%")
    }, deleteFile = FALSE)
}

shinyApp(ui = ui, server = server)

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Visualize Noise in an Image"),

  # Sidebar with a slider input for noise st dev and filter width
  sidebarLayout(
    sidebarPanel(
      sliderInput("sigma", "Noise Sigma:", min = 0.01, max = 3.0,
                value = 1.5, step = 0.01),
      sliderInput("filterWidth", "Filter Width:", min = 0.01, max = 3.0,
                value = 1.5, step = 0.01)
    ),
    # Show a png image of output
    mainPanel(
        imageOutput("image_output")
    )
  )
))

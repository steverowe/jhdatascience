library(shiny)
library(dplyr)
library(MASS)
library(RColorBrewer)

# Define server logic required to draw a parallel coordinates graph
shinyServer(function(input, output) {
  
  # Expression that generates a parallel coordinates graph The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$distPlot <- renderPlot({
    vars <- input$variables#c("mpg",  "cyl",  "disp", "hp",   "drat", "wt",   "qsec", "vs",   "am",   "gear", "carb")
    
    cars <- dplyr::select(mtcars, mpg, one_of(vars))
    cars <- filter(cars, mpg >= input$minmpg & mpg <= input$maxmpg)
    
    parcoord(cars,col=brewer.pal(12, "Paired"), var.label=T)
  })
})

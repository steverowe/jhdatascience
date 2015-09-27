library(shiny)

# Define UI for application that draws parallel coordinate graph
shinyUI(fluidPage(
  
  
  # Application title
  titlePanel("Explore MPG"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      numericInput("minmpg", "Minimum MPG", value=min(mtcars$mpg), min=min(mtcars$mpg), max=max(mtcars$mpg), step=0.1),
      numericInput("maxmpg", "Maximum MPG", value=max(mtcars$mpg), min=min(mtcars$mpg), max=max(mtcars$mpg), step=0.1),
      checkboxGroupInput("variables", "Variables", 
                         c("cyl",  "disp", "hp",   "drat", "wt",   "qsec", "vs",   "am",   "gear", "carb"),
                         selected=c("cyl",  "disp", "hp",   "drat", "wt",   "qsec", "vs",   "am",   "gear", "carb"))
    ), 
    
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  ),
  h4("Instructions"),
  p("This is what is called a Parallel Coordinates Graph.  It allows us to explore the relationship between different variables.",
    "We will be using it to explore the relationship between MPG and otehr variables using the mtcars dataset."),
  p("You can set the minimum and maximum MPG range to explore.  You can also select which variables to see the relationship of.",
    "Selecting fewer variables may make the relationships more clear."),
  withTags(table(border=1,
    tr(
      td("Variable"),
      td("Description")
    ),
    tr(td("mpg"), td("Miles/(US) gallon")),
    tr(td("cyl"), td("Number of cylinders")),
    tr(td("disp"), td("Displacement (cu.in.)")),
    tr(td("hp"), td("Gross horsepower")),
    tr(td("drat"), td("Rear axle ratio")),
    tr(td("wt"), td("Weight (lb/1000)")),
    tr(td("qsec"), td("1/4 mile time")),
    tr(td("vs"), td("V or Straight")),
    tr(td("am"), td("Transmission (0 = automatic, 1 = manual)")),
    tr(td("gear"), td("Number of forward gears")),
    tr(td("carb"), td("Number of carburetors"))
  ))
  
))

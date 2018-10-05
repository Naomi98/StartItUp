library(shiny)

shinyUI(fluidPage(
  
  tags$head(
    tags$style(HTML("
                    @import url('//fonts.googleapis.com/css?family=Acme|Cabin:400,700');
                    
                    h1 {
                    font-family: 'Acme'
                    ;
                    font-weight: 500;
                    line-height: 1.1;
                    color: purple;
                    text-align: center;
                    margin-left:0;
                    }
                    
                    #sidebar {
                    
                    background-color: #dec4de;
                    
                    width:240px;
                    }
                    
                    
                    "))
    ),
  
  # Header or title Panel 
  titlePanel(h1('Start It Up', align = "center")),
  
  # Sidebar panel
  sidebarPanel(id="sidebar",
    
    
    
    selectInput("var", label = "1. Select a meal", 
                choices = c("Meal A" = 1, "Meal B" = 2, "Meal C" = 3),
                selected = 1) ,
    selectInput(
      "from_year", label = "Select the week from which you want to predict?",
      choices = c("3"=3,"4"=4,"5"=5),
      selected=3
    )
    
    
    
  ),
  
  # Main Panel
  mainPanel(
  
    textOutput("myhist")
    
  )
  
)
)
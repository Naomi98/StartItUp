library(shiny) # Load shiny package
library(readr)
library(fpp)
library(knitr)
library(vars)
library(forecastHybrid)
library(rmarkdown)
library(ggplot2)

data <- read_csv("C:/Users/Aiman Fatima/Desktop/WIE HACKATHON/2.csv")
data$meal_type <- as.factor(data$meal_type)
data$Day_of_the_week <- as.factor(data$Day_of_the_week)
data$Week_of_the_month <- as.factor(data$Week_of_the_month)
data <- data[order(as.integer(data$Week_of_the_month),decreasing = FALSE), ]


shinyServer(
  
  
  function(input, output) {
    
    output$myhist <- renderText(
      
      { 
    
    
    
            colm = as.numeric(input$var)
            year = as.numeric(input$from_year)
            df<-data.frame(data[data$meal_type==colm,])
            y=df[,4]
        
            y<-ts(y, start=c(1,1), end=c(4,2), frequency = 4)
            
            
            train<-window(y,start=c(1,1), end=c(2,4))
            
            # test period
            test<-window(  y,start=3, end = 4)
            
            # number of steps to forecast
            h = length(test)
            
            # out of sample forecast
            h2 = 6
            ###trend & seasonal
            tps <- tslm(train ~trend)
            d<-  forecast(tps, h=h)
           
            
            
          
            paste("Predicted sales for next week", d$mean[1])
        
        
        
        
        
      }
      
    )   
  }
  
)



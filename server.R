library(shiny)
library(randomForest)
data(iris)
set.seed(12345)
modFit <- randomForest(Species ~ ., data=iris)

shinyServer(
    function(input, output) {  
        output$Sepal.Length <- renderPrint({input$Sepal.Length})
        output$Sepal.Width <- renderPrint({input$Sepal.Width})
        output$Petal.Length <- renderPrint({input$Petal.Length})
        output$Petal.Width <- renderPrint({input$Petal.Width})
        output$Species <- renderPrint({as.character(predict(modFit, data.frame(Sepal.Length=input$Sepal.Length, Sepal.Width=input$Sepal.Width, Petal.Length=input$Petal.Length, Petal.Width=input$Petal.Width)))})        
    }
)
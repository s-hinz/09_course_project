library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Iris classification"),
    sidebarPanel(        
        p('Please specifiy the sepal and petal length and width to find out which of three species your flower is predicted to belong to:'),
        sliderInput('Sepal.Length', 'Sepal length (cm): ', round(mean(iris$Sepal.Length),1), min=round(min(iris$Sepal.Length),0), max=round(max(iris$Sepal.Length),0)+1, step=0.1),
        sliderInput('Sepal.Width', 'Sepal width (cm): ', round(mean(iris$Sepal.Width),1), min=round(min(iris$Sepal.Width),0), max=round(max(iris$Sepal.Width),0)+1, step=0.1),
        sliderInput('Petal.Length', 'Petal length (cm): ', round(mean(iris$Petal.Length),1), min=round(min(iris$Petal.Length),0), max=round(max(iris$Petal.Length),0)+1, step=0.1),
        sliderInput('Petal.Width', 'Petal width (cm): ', round(mean(iris$Petal.Width),1), min=round(min(iris$Petal.Width),0), max=round(max(iris$Petal.Width),0)+1, step=0.1),
        submitButton('Submit')
    ),
    mainPanel(
        p('This application allows you to specify the sepal and petal length and width of an Iris flower.
           The application will then then try to predict which of three Iris species the flower belongs to.'),
        p('The prediction uses a model that was built on the iris dataset in R which contains data collected by Edgar Anderson (1935).
           It contains data for Iris setosa, versicolor and virginica. For that reason the application can only return predictions for these three species.'),            
        p('Please specify on the left side bar the sepal and petal length and width of your Iris flower and then press "Submit".'),
        h4('You have specified the following:'),
        verbatimTextOutput("Sepal.Length"), verbatimTextOutput("Sepal.Width"), verbatimTextOutput("Petal.Length"), verbatimTextOutput("Petal.Width"),
        h4('The flower is predicted to belong to the following species: '),
        verbatimTextOutput("Species")
    )
))
library(shiny)
library(ggplot2)

data(mtcars)
mtcars1 <- mtcars
mtcars1$cyl <- factor(mtcars1$cyl)
mtcars1$vs <- factor(mtcars1$vs)
mtcars1$am <- factor(mtcars1$am)
mtcars1$gear <- factor(mtcars1$gear)
mtcars1$carb <- factor(mtcars1$carb)

datasetx <- mtcars1

function(input, output) {
    
    datasetx <- reactive({mtcars1})    
    
    output$plot <- renderPlot({
        
        p <- ggplot(datasetx(), aes_string(x=input$x, y=input$y)) + geom_point(size=input$pointSize)
        
        if (input$color != 'None')
            p <- p + aes_string(color=input$color)
        
        facets <- paste(input$facet_row, '~', input$facet_col)
        if (facets != '. ~ .')
            p <- p + facet_grid(facets)
        
        if (input$jitter)
            p <- p + geom_jitter()
        if (input$smooth)
            p <- p + geom_smooth()
             
        print(p)
        
    }, height=700)
    
}
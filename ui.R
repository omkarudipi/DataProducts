library(shiny)
library(ggplot2)


dropdownlist <- c("Miles/(US) gallon (mpg)" = "mpg", 
"Number of cylinders (cyl)" = "cyl",
"Displacement (cu.in.) (displ)" = "disp",
"Gross horsepower (hp)" = "hp",
"Rear axle ratio (drat)" = "drat",
"Weight (lb/1000) (wt)" = "wt",
"1/4 mile time (qsec)" = "qsec",
"V/S (vs)" = "vs",
"Transmission (0 = automatic, 1 = manual) (am)" = "am",
"Number of forward gears (gear)" = "gear",
"Number of carburetors (carb)" = "carb")


fluidPage(
    
    titlePanel("Motor Trend Car Road Test (mtcars) Exploration"),
    
    sidebarPanel(
        
        
        h4("Plot Dimensions"),
        selectInput('y', 'Y-axis', dropdownlist, dropdownlist[[1]]),
        selectInput('x', 'X-axis', dropdownlist, dropdownlist[[2]]),
        selectInput('color', 'Z-axis (optional)', c('None', dropdownlist)),

        br(),
        h4("Plot Options"),
        sliderInput('pointSize', 'Point Size', min=1, max=10, value=2, step=1, round=0),
        checkboxInput('jitter', 'Jittered to reduce overplotting'),
        checkboxInput('smooth', 'Smoothed conditional mean'),
        
        br(),
        h4("Multi-Plot Options"),
        selectInput('facet_row', 'Facet Row', c(None='.', dropdownlist)),
        selectInput('facet_col', 'Facet Column', c(None='.', dropdownlist))
    ),
    
    mainPanel(
        tabsetPanel(
            tabPanel("Introduction", 
                     br(),
                     "Here is a short introduction to get started using this Shiny App. This App uses R's GGPlot2 and some of its features to render the plot, which will be displayed in the 'Plot' tab.",
                     br(),
                     br(),
                     "Data loaded is from R Base package's 'mtcars' which contain data extracted from the 1974 Motor Trend US magazine, and comprises of fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973-74 models).",
                     br(),
                     br(),
                     "The sidebar panel allows you to choose the key axis (X & Y) as well as a third optional axis (Z) which will be shown in color.",
                     br(),
                     br(),
                     "The sidebar panel also allows you to change your plot size, enable jitter, smoothing (works well on non-factored dimensions) as well as use advanced facet plots (take note: complex facets might take slightly longer to render).",
                     br(),
                     br(),
                     "We hope that this App would allow you to explore and identify patterns from the data for your analysis."
                     ),
            tabPanel('Plot', plotOutput('plot'))
        )
        
        
        
    )
)
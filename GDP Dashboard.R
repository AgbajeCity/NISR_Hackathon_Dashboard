# Load required packages
library(shiny)
library(tidyverse)
library(ggplot2)
library(plotly)

# Load data 
gdp <- read.csv("R_GDP National Accounts 2023 Q2_r - Table A Q.csv")

# Wrangle data
gdp <- gdp %>%
  filter(Year >= 2017) %>%
  select(-X1) %>%
  pivot_longer(cols = starts_with("20"),
               names_to = "quarter",
               values_to = "value") %>%
  separate(quarter, into = c("year", "quarter"), sep = 4) %>%
  mutate(quarter = paste0(year, " Q", quarter)) %>%
  mutate(across(where(is.character), as.factor))

# Define UI
ui <- fluidPage(
  
  # App title
  titlePanel("Rwanda GDP Dashboard"),
  
  # Sidebar layout
  sidebarLayout(
    
    # Inputs
    sidebarPanel(
      
      # Year selector
      selectInput("year", 
                  "Select Year",
                  choices = levels(gdp$year),
                  selected = max(levels(gdp$year))),
      
      # Quarter selector  
      selectInput("quarter",
                  "Select Quarter",
                  choices = levels(gdp$quarter),
                  selected = max(levels(gdp$quarter)))
      
    ),
    
    # Main panel
    mainPanel(
      
      tabsetPanel(type = "tabs",
                  tabPanel("GDP Time Series", plotOutput("ts_plot")),
                  tabPanel("GDP Components", plotOutput("comp_plot"))
      )
      
    )
  )
)

# Define server
server <- function(input, output) {
  
  # Filter data reactive
  gdp_data <- reactive({
    
    gdp %>%
      filter(year == input$year, 
             quarter %in% input$quarter)
    
  })
  
  # Time series plot
  output$ts_plot <- renderPlot({
    
    gdp_data() %>%
      ggplot(aes(x=quarter, y=value)) +
      geom_line() +
      labs(title = "GDP Time Series",
           x = "Quarter",
           y = "GDP (Billions Frw)")
    
  })
  
  # Components plot
  output$comp_plot <- renderPlot({
    
    gdp_data() %>%
      filter(Variable %in% c("GDP at current prices", "GDP at constant 2017 prices")) %>% 
      ggplot(aes(x=quarter, y=value, color = Variable)) +
      geom_line() +
      labs(title = "GDP Components",
           x = "Quarter", 
           y = "GDP (Billions Frw)")
    
  })
  
}

# Run the app 
shinyApp(ui = ui, server = server)
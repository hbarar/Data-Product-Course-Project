

library(shiny)
shinyUI(fluidPage(
  
  titlePanel("Setting"),
  
  
  sidebarLayout(
      
      
  sidebarPanel(
        
       selectInput("gn", "Gender:",choices=c("Male", "Female")),
       selectInput("rn", "Rank:",choices=c("Prof", "AsstProf","AssocProf")),
       
       sliderInput("yrp", "Years since PhD:", 1, 50, value = 5),
       sliderInput("yrs","Years of service:",min = 1,max = 50,value=c(15,22), step=1)
    ),
  
  mainPanel(
      
      tabsetPanel(
          tabPanel("Plot", plotOutput("Plot"),
                   
                   h3("Predicted Median salary for discipline A:"),
                   textOutput("pred1"),
                   h3("Predicted Median salary for discipline B:"),
                   textOutput("pred2")
                   
                   
                   
                   
                   ),
          tabPanel("Table", tableOutput("table")),
          tabPanel("About",mainPanel(includeMarkdown("about.Rmd")))
         
          
          
      )
  )
  
  
)


))

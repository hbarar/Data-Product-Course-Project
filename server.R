

library(shiny)
library(dplyr)



data <- read.csv("Salary.csv", sep=",", header=T)
colnames(data)<- c("count","rank","discipline","PhD","service","sex","salary")


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    
    
    dataInput<- reactive({
        yrs<-input$yrs
        a<-min(yrs)
        b<-max(yrs)
        c<-input$yrp
        d<-input$gn
        e<-input$rn
        filter(data,service>a&service<b&PhD>c&sex==d&rank==e)
        
    })
    
    
   mdat<-dataInput
   mdatA<- reactive({filter(mdat(),discipline=="A")})
   mdatB<- reactive({filter(mdat(),discipline=="B")})
   
  
    
#===========================================   
    output$Plot<-renderPlot({
        
        par(mfrow=c(1,2))
        
        x<-mdatA()[,7]
        hist(x, xlab="Salary" ,main = "Discipline A")
        abline(v = mean(x), col="red", lwd=3, lty=2)
        
        x<-mdatB()[,7]
        hist(x, xlab="Salary" ,main = "Discipline B")
        abline(v = mean(x), col="red", lwd=3, lty=2)
        
        
    })
    #=============================================
    output$pred1 <- renderText({
        median(mdatA()[,7])
    })
    output$pred2 <- renderText({
        median(mdatB()[,7])
    })
    #=========================================
    #===========================================   
    output$table <- renderTable({
        dataInput()
    })
    #=============================================  
    
   
  
  
  
  
  
  
  
  
  
  
})


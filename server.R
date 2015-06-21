library(shiny)
calculateExpectedAge=function(currentAge,income,exercise,smoking,areaR,locationR,workType,gender){
        baseAge=80
        if(currentAge>30)
                baseAge=baseAge-(0.1*currentAge) ##Young have better chances of survival due better medical care
        if(income<20000)
                baseAge=baseAge-5 ##Remove 5 years for being poor hence with inadequate health care
        else if(income>80000)
                baseAge=baseAge+5 ## Has access to better expensive health care and fitness stuff
        if(exercise==1)
                baseAge=baseAge+5 ## +5 for exercise
        if(smoking==1)
                baseAge=baseAge-7 ## -7 for smoking
        if(areaR==2)
                baseAge=baseAge+5 ## semi urban has goodness of both hence live more cleaner air and also access to better health care
        else if(areaR==1)
                baseAge=baseAge-5
        if(locationR==1)
                baseAge=baseAge+5 ## People on islands and near to sea live more
        if(workType==1)
                baseAge=baseAge-4 ## -4 for sedantary lifestyle
        if(gender==2)
                baseAge=baseAge+5 ## Woman live longer
        
         paste(baseAge,"Years")
        
}
shinyServer(
        function(input, output) {
                output$age<-renderPrint(paste(input$age,"Years old"))
                output$prediction <- renderPrint({calculateExpectedAge(input$age,input$income,input$exercise,input$smoke,input$areaofresidence,input$locationofresidence,input$worktype,input$gender)})
        }
)
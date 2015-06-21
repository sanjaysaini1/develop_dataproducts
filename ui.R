library(shiny)
shinyUI(pageWithSidebar(
        headerPanel("Predict your life expectancy by changing the values in the sidebar below:"),
        sidebarPanel(
                numericInput('age', 'Input your age (in yrs):', 25, min = 20, max = 50, step = 1),
                numericInput('income', 'Annual Income in USD:', 50000, min = 0, max = 250000, step = 5000),
                
                radioButtons("exercise", "Do You Excercise:",
                             c("Yes" = 1,
                               "No" = 0)),
                radioButtons("smoke", "Do You Smoke:",
                             c("Yes" = 1,
                               "No" = 0)),
                radioButtons("areaofresidence", "Area of residence:",
                             c("Urban" = 1,
                               "Semi-urban" = 2,
                               "Rural" = 3)),
                radioButtons("locationofresidence", "Location of residence:",
                             c("Near Sea" = 1,
                               "Far Inland" = 2)),
                radioButtons("worktype", "Work Type:",
                             c("Sedantary" = 1,
                               "Active" = 2)),
                radioButtons("gender", "Gender:",
                             c("Male" = 1,
                               "Female" = 2))
        ),
        mainPanel(
              
                h4("You are:"),
                verbatimTextOutput("age"),
                h3('You will live:'),
                verbatimTextOutput("prediction"),
                p("Based on the assumption below the prediction above is made: "),
                p("1. Young below 30years have better chances of survival due increasingly better medical care."),
                p("2. Poor[Annual Income below 20000] has inadequate health care."),
                p("3. Rich[Annual Income above 80000] has better health care."),
                p("4. Exercising people live longer."),
                p("5. Smokers live lesser."),
                p("6. Semi urban has goodness of both(rural and urban) hence live more cleaner air and also access to better health care."),
                p("7. People on islands and near to sea live more."),
                p("8. Sedantary lifestyle people die earlier."),
                p("9. Women live longer.")
                
                
             
        )
))
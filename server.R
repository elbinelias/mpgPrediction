library(shiny)
library(datasets)
library(randomForest)
data("mtcars")
mtcar <- mtcars
library(caret)
colnameslist <- c('cyl','disp','hp','wt')
allVal <- data.frame(matrix(nrow=0,ncol=4,dimnames=list(NULL,colnameslist)))
shinyServer(
    function(input,output,session){
        data = reactive({
        allVal[1,1] <- as.numeric({input$nCyl})
        allVal[1,2] <- as.numeric(input$nDisp)
        allVal[1,3] <- as.numeric(input$nHp)
        allVal[1,4] <- as.numeric(input$nWt)
        return(list(allVal=allVal))
        })
        output$cyl <- renderText({input$nCyl})
        output$disp <- renderText({input$nDisp})
        output$wt <- renderText({input$nWt})    
        output$hp <- renderText({input$nHp})
        
        output$goText <- renderText({
            if(input$go > 0) "mpg Prediction is:"
        })
        observeEvent(input$go, {
            modelfit <- train(mpg ~ cyl+disp+hp+wt, data=mtcar[,c(1:4,6)],method="rf",preProcess=c('pca'),trControl = trainControl(method = "cv"))
            pred <- predict(modelfit,data()$allVal)
            output$aV <- renderPrint(cat(pred[[1]]))
        })
        
    }
)
# The goal of your project is to predict the manner in which they did the exercise. This is the "classe" variable in the training set. You may use any of the other variables to predict with. You should create a report describing how you built your model, how you used cross validation, what you think the expected out of sample error is, and why you made the choices you did. You will also use your prediction model to predict 20 different test cases. 
# 
# 1. Your submission should consist of a link to a Github repo with your R markdown and compiled HTML file describing your analysis. Please constrain the text of the writeup to < 2000 words and the number of figures to be less than 5. It will make it easier for the graders if you submit a repo with a gh-pages branch so the HTML page can be viewed online (and you always want to make it easy on graders :-).
# 2. You should also apply your machine learning algorithm to the 20 test cases available in the test data above. Please submit your predictions in appropriate format to the programming assignment for automated grading. See the programming assignment for additional details. 

library(dplyr)
library(caret)
library(ggplot2)
library(doParallel)
registerDoParallel(cores=3)
set.seed(91315)

pml.training <- read.csv("data/pml-training.csv", stringsAsFactors = F)

inTrain <- createDataPartition(pml.training$X, p=0.8, list=F)
pml.training <- mutate(pml.training, class = factor(classe)) %>% 
  select(class, roll_belt:total_accel_belt, gyros_belt_x:total_accel_arm, gyros_arm_x:magnet_arm_z, roll_dumbbell:yaw_dumbbell, 
                       total_accel_dumbbell, gyros_dumbbell_x:yaw_forearm, total_accel_forearm, gyros_forearm_x:magnet_forearm_z)
training <- pml.training[inTrain,]
testing <- pml.training[-inTrain,]

#saveRDS(myVariableName, file="myFile.rds")
#myVariableName = readRDS("myFile.rds")


set.seed(91317)

train_control <- trainControl(method="cv", number=10, savePred=T)
rf_cv.mod <- train(class~., data=pml.training, trControl=train_control, method="rf")
saveRDS(rf_cv.mod, file="data/rf_cv.rds")
summary(rf_cv.mod)
varImp(rf_cv.mod)

rf_cv.mod <- readRDS(file="data/rf_cv.rds")

rf_cv.predictions <- predict(rf_cv.mod, newdata=pml.training)
confusionMatrix(rf_cv.predictions, pml.training$class)

probs <- predict(rf_cv.mod, newdata=testing, type="prob")


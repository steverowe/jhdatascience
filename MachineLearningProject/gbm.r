set.seed(91318)
gbm.mod <- train(class~., data=training, method="gbm")
saveRDS(gbm.mod, file="data/gbm.rds")
summary(gbm.mod)
varImp(gbm.mod)

gbm.mod <- readRDS(file="data/gbm.rds")

gbm.predictions <- predict(gbm.mod, newdata=testing)
confusionMatrix(gbm.predictions, testing$class)

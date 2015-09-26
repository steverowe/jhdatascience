set.seed(91316)

rf.mod <- train(class~., data=training, method="rf")
saveRDS(rf.mod, file="data/randomforest.rds")
summary(rf.mod)
varImp(rf.mod)

rf.mod <- readRDS(file="data/randomforest.rds")

rf.predictions <- predict(rf.mod, newdata=testing)
rf.cm <- confusionMatrix(rf.predictions, testing$class)

probs <- predict(rf.mod, newdata=testing, type="prob")



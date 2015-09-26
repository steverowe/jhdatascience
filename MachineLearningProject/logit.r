library(caret)
multinom.mod <- train(class~., data=training, method="glm", family="multinom")
saveRDS(multinom.mod, file="multinom.rds")

predictions <- predict(multinom.mod, newdata=testing)
confusionMatrix(predictions, testing$class)
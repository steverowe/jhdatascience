pml.testing <- read.csv("data/pml-testing.csv", stringsAsFactors = F)

answers <- predict(rf.mod, newdata=pml.testing)
probs <- predict(rf.mod, newdata=pml.testing, type="prob")
cbind(probs, answers)

pml_write_files = function(x){
  n = length(x)
  for(i in 1:n){
    filename = paste0("data/problem_id_",i,".txt")
    write.table(x[i],file=filename,quote=FALSE,row.names=FALSE,col.names=FALSE)
  }
}

pml_write_files(answers)


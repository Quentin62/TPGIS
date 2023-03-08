d <- read.table("http://math.univ-lille1.fr/~preda/GIS5/data_roc.txt", sep = "\t", header = TRUE)
head(d, 3)

table(d$PREMATURE)

prop.table(table(d$PREMATURE))

m <- glm(PREMATURE ~ AGE + as.factor(DIAB), family = "binomial", data = d)
summary(m)

m_null <- glm(PREMATURE ~ 1, family = "binomial", data = d)
r2 <- 1 - logLik(m) / logLik(m_null)
print(r2)

print((m$null.deviance - m$deviance) / m$null.deviance)

library(ResourceSelection)

hoslem.test(m$y, fitted(m))


library(ROCR)

pr <- prediction(m$fitted.values, d$PREMATURE)
perf <- performance(pr, "tpr", "fpr")
plot(perf)
lines(c(0, 1), c(0, 1), lty = 2)

# les vecteurs qui permettent de tracer la courbe
perf@x.values[[1]]
perf@y.values[[1]]
perf@alpha.values[[1]]

library(caTools)
colAUC(m$fitted.values, d$PREMATURE)


### Régression multinomiale

library(ordinal)
library(nnet)
data("wine", package = "ordinal")
head(wine)

summary(wine)
barplot(table(wine$temp))
barplot(table(wine$contact))
barplot(table(wine$rating))
barplot(table(wine$judge))
barplot(table(wine$bottle))
hist(wine$response)

m <- multinom(rating ~ temp, data = wine)

confint(m)
summary(m)
m$AIC
y_pred <- predict(m, type = "class")

table(wine$rating, y_pred)

mean(as.numeric(wine$rating) == as.numeric(y_pred))


proba <- predict(m, type = "probs")

apply(proba, 1, which.max)

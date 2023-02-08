# package pour imputation multiple
library(mice)

# aperçu des données
head(airquality)

# stats univariées
summary(airquality)

# On enlève les colonnes concernant les dates
X <- airquality[, 1:4]

# information sur les manquants
md.pattern(X)

# Représentation des manquants
library(VIM)
marginplot(airquality[, c(1, 2)], col = mdc(1:2), cex = 1.2, cex.lab = 1.2, cex.numbers = 1.3, pch = 19)
marginplot(airquality[, c(1, 3)], col = mdc(1:2), cex = 1.2, cex.lab = 1.2, cex.numbers = 1.3, pch = 19)
marginplot(airquality[, c(1, 4)], col = mdc(1:2), cex = 1.2, cex.lab = 1.2, cex.numbers = 1.3, pch = 19)
marginplot(airquality[, c(2, 3)], col = mdc(1:2), cex = 1.2, cex.lab = 1.2, cex.numbers = 1.3, pch = 19)
marginplot(airquality[, c(2, 4)], col = mdc(1:2), cex = 1.2, cex.lab = 1.2, cex.numbers = 1.3, pch = 19)


# m : nb imputation
# méthode d'imputation par défaut pmm predictive mean matching
# les données simulées par pmm auront les mêmes caractéristiques que les vraies données (bornées, entières...)
# http://statisticalhorizons.com/predictive-mean-matching
imp <- mice(X, m = 5, seed = 10, print = FALSE, maxit = 50)

# imputation dans $imp
imp$imp

# récupérer l'imputation numéro 2
Ximp <- complete(imp, 2)
head(Ximp)

# Représentation graphique des données imputées
library(lattice)
stripplot(imp, pch = 20, cex = 1.2)
xyplot(imp, Ozone ~ Solar.R | .imp, pch = 20, cex = 1.4)

# Comparaison distribution
hist(Ximp[, 1], col = "lightblue", probability = TRUE, xlab = "Ozone")
hist(X[, 1], density = 2, add = TRUE, border = "red", probability = TRUE, col = "red")

hist(Ximp[, 2], col = "lightblue", probability = TRUE, xlab = "Solar.R")
hist(X[, 2], density = 2, add = TRUE, border = "red", probability = TRUE, col = "red")

# évolution des valeurs pendant l'algo
plot(imp, c("Solar.R", "Ozone"))


# Appliquer régression linéaire à toutes les matrices imputées
fit <- with(imp, lm(Ozone ~ Solar.R + Wind + Temp))

# Résultats sous forme de liste
fit

# fit$analyse est une liste contenant toutes les régressions linéaires faites
sapply(fit$analyse, coef)  # tt les coeff

# synthèse des résultats (moyenne des coefficients de la régression linéaire)
fitpool <- pool(fit)
fitpool
fitpool$pooled$estimate  # coefficient moyens


# plus de stat : intervalle de confiances...
# lambda : proportion de la variance totale attribuable aux données manquantes  (B + B/m) / T
# Fraction of information about the coefficients missing due to nonresponse
# fmi : measure of uncertainty about the values imputed for missing element
# it is the proportion of the total variance of a survey estimate explained by the between-imputation variability
# the underlying idea is that if the FMI is large,it means that there is much uncertainty on the imputed values
# of nonrespondents and, therefore, this indicates a large risk for nonresponse bias
summary(fitpool)

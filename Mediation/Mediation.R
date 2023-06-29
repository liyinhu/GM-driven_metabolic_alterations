library("mediation")
library("lme4")

data<-read.delim('GM_MS.txt', header =T)

#forward
a <- lme4::lmer(X11Z_14Z_17Z_Eicosatrienoic_Acid ~ Turicibacter + ( 1 | Group), data,control = lmerControl( optCtrl = list(maxfun = 2e5), calc.derivs = FALSE), na.action=na.exclude)

b <- glm(as.factor(Group) ~ X11Z_14Z_17Z_Eicosatrienoic_Acid  + Turicibacter -1 , data, family=binomial(link = "logit"), na.action=na.exclude)

result <- mediate(a, b, treat = "Turicibacter", mediator = "X11Z_14Z_17Z_Eicosatrienoic_Acid", sims = 100)

summary(result)

#reverse
a <- glm(Deoxycholic_acid_.DCA. ~ Group, data, family=gaussian(link = "identity"))

b <- lm(Erysipelatoclostridium  ~ Group + Deoxycholic_acid_.DCA., data)

result <- mediate(a, b, treat = "Group", mediator = "Deoxycholic_acid_.DCA.")

summary(result)




# Clean up the working environment
rm(list = ls())
# Verify working directory, should be ~/Documents/Analyses/lastname_first
getwd()

if(!require(Rmisc)){install.packages("Rmisc")}
if(!require(DescTools)){install.packages("DescTools")}
if(!require(boot)){install.packages("boot")}
if(!require(rcompanion)){install.packages("rcompanion")}
if(!require(summarytools)){install.packages("summarytools")}
if(!require(tidyverse)){install.packages("tidyverse")}

# Check for updates
tidyverse_update()




library(readr)
insulation <- read_csv("datasets/demos/insulation.csv")
View(insulation)

model01 <- lm(heat_loss ~ leanness, data = insulation)
autoplot(model01, smooth.colour = NA)
insulation_plus <- augment(model01)
ggplot(data = insulation_plus)+
  geom_point(aes(x = leanness, y= .resid))

insulation <- insulation %>%
  mutate(heat_loss_resid = resid(model01))
ggplot(data = insulation) +
  geom_point(aes(x = leanness, y = heat_loss_resid))

summary(model01)

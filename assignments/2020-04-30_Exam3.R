# Clean up the working environment
rm(list = ls())
# Verify working directory, should be ~/Documents/Analyses/lastname_first
getwd()

### Install and load packages ####
# The following commands will install these packages if they are not already installed, 
# and then load them!
# Install package ggfortify, *note* only do install.packages ONCE
# ggfortify is a package that works with ggplot2 to make nice plots
# install.packages("ggfortify")
library("ggfortify")
# multcomp is used for contrasts and multiple comparisons
# install.packages("multcomp")
library("multcomp")
# nlme is used for random effects ANOVA
# install.packages("nlme")
library("nlme")

if(!require(Rmisc)){install.packages("Rmisc")}
if(!require(DescTools)){install.packages("DescTools")}
if(!require(boot)){install.packages("boot")}
if(!require(rcompanion)){install.packages("rcompanion")}
if(!require(summarytools)){install.packages("summarytools")}
if(!require(tidyverse)){install.packages("tidyverse")}

library(readr)
caffeine <- read_csv("Documents/Analyses/mcneill-kirk/datasets/demos/caffeine.csv")
View(caffeine)

###
i. null hypothesis: There is no significant difference between all three groups(
  ii. predictor variable- gender and progesterone levels response varable- caffeine metabolism (half life)
  iii. Anova/ Tukeys HSD
  iv. Assumptions- Observations are a random sample from a population and are independent from eachother, equal variance among groups, Response variable is normally distributed
  
  
  ggplot(caffeine) +
    geom_histogram(aes(half_life), binwidth = 1)+
    facet_wrap(~group)
  ggplot(caffeine) +
    geom_boxplot(aes(x = group, y = half_life))
  ggplot(caffeine)+
    geom_qq(aes(sample = half_life, color = group))
  
  summ_caffeine <- caffeine %>%
    group_by(group) %>%
    summarise(mean_half_life = mean(half_life),
              sd_half_life = sd(half_life))
  ratio <-(max(summ_caffeine$sd_half_life))/(min(summ_caffeine$sd_half_life))
  
  caffeine <- caffeine %>%
    mutate(group = fct_recode(group, norm_prog = "norm_prog",
                              male = "male",
                              high_prog = "high_prog"
    ))  
  ggplot(caffeine, aes(x = group, y = half_life))+
    geom_boxplot() +
    theme_bw() +
    coord_flip()
  ggplot(caffeine) +
    geom_histogram(aes(half_life), binwidth = 1)+
    facet_wrap(~group)
  ggplot(caffeine)+
    geom_qq(aes(sample = half_life, color = group))
  
  
  model01 <- lm(half_life~group, data = caffeine)
  
  autoplot(model01)  
  anova(model01)  
  summary(model01)  
  
  planned <- glht(model01, linfct = 
                    mcp(group = c("norm_prog - male = 0",
                                  "norm_prog - high_prog = 0",
                                  "male - high_prog = 0")))
  confint(planned)
  summary(planned)
  
  tukey <- glht(model01, linfct = mcp(group = "Tukey"))
  summary(tukey)   
  #half life varied significanly between the norm_prog group and the high_prog group with a p-value of .00103
  # Half life did not significantly vary between male and norm_prog groups with a p-value .79
  
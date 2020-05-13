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

baker <- baker %>% mutate(differences = before - after)
head(baker, 20)

baker <- baker %>%
  gather(key = "group", value = "concentration", before, after)
head(baker, 20)


baker <- baker %>% mutate(differences = before - after)
head(baker, 20)

t.test(before, after, mu=0, alt="two.sided", paired=T, conf.level = 95)

baker <- baker %>%
  mutate(diff = After - Before)
ggplot(baker) +
  geom_histogram(aes(diff), binwidth = 2)

ggplot(baker)+
  geom_qq(aes(sample = diff))

ggplot(baker) +
  geom_boxplot(aes(x = "", y = diff))+
  stat_summary(aes(x = "", y = diff), 
               fun.y=mean, 
               colour="blue", 
               fill = "blue",
               geom="point", 
               shape=21, 
               size=3)
ggplot(baker)+
  geom_qq(aes(sample = diff))

baker <- baker %>%
  mutate(diff_logs = logAfter - logBefore)
t.test(baker$After, baker$Before, 
       alternative = "two.sided", paired = TRUE, conf.level = 0.95)

install.packages("abd", repos="http://R-Forge.R-project.org")
library("abd")

algae <- AlgaeCO2

summ_CO2 <- algae %>%
  group_by(treatment) %>% 
  summarise(mean_growthrate = mean(growthrate),
            sd_growthrate = sd(growthrate),
            n_growthrate = n())
ratio <-(max(summ_CO2$sd_growthrate))/(min(summ_CO2$sd_growthrate))

ggplot(algae) +
  geom_histogram(aes(growthrate), binwidth = 1)+
  facet_wrap(~treatment)
ggplot(algae) +
  geom_boxplot(aes(x = treatment, y = growthrate))+
  stat_summary(aes(x = treatment, y = growthrate), 
               fun.y=mean, 
               colour="blue", 
               fill = "blue",
               geom="point", 
               shape=21, 
               size=3)
t.test(growthrate ~ treatment, data = algae, var.equal = TRUE, alternative = "two.sided", conf.level = 0.95)


# Error line 16 did not read in baker file, variable names all lower case
# instead of capitalized,did not correctly create diff variable until line 29,
# so could not have t-test in line 27 run correctly.  Script does not create
# variables called logAfter or logBefore so mutate function in line 49 cannot 
# run.  5/5





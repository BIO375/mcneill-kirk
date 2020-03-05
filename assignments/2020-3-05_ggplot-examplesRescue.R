# Clean up the working environment
rm(list = ls())

# Verify working directory, should be ~/Documents/Analyses/lastname_first
getwd()

### Install and load packages ####
# The following commands will install these packages if they are not already installed, 
# and then load them!

if(!require(Rmisc)){install.packages("Rmisc")}
if(!require(DescTools)){install.packages("DescTools")}
if(!require(boot)){install.packages("boot")}
if(!require(rcompanion)){install.packages("rcompanion")}
if(!require(summarytools)){install.packages("summarytools")}
if(!require(tidyverse)){install.packages("tidyverse")}
library(readr)
library(tidyverse)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))
### this is a simple template for a dot plot with just 2 variables

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))
### this dot plot is a bit more complicated but seperates a third variable by color which is seen as class in this example. 

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)
### facet wrap allows us to seperate the third variable to make different graphs for each which allows us to easily compare data side by side.

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))
### turns a dot plot into a smooth line which could be useful to show trends a little more clearly.

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))
### same as the previous one but now adds the third variable and you can destinguish it by linetype

ggplot(economics_long, aes(date, value01, colour = variable)) +
  geom_line()
### this one makes the third variable in the line graph be different from other variables through the colour function.

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))
### this maps two variables for one set of data and has a dot plot and then the average linear regression model as well which is seen by the smooth function.

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut))
### the simplest version of a bar graph and Rstudio automatically makes the y variable count if you don't insert anything

ggplot(data = diamonds) + 
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  )
### very similar to a bar graph but shows up as a vertical line with a point telling us the median and it also extends up to the max and down to the min to really just show us a quick summary of mulitple statistics from a dataset. This be a good one.

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")
### this creates seperate bar graphs and seperates them by the third variable by color which allows for easy comparison within a variable and between variables.

ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot() +
  coord_flip()
### good example of a box plot graph with multiple box plots, the coord_flip flips the graph horizontally which just is for prefrence but I like it because it seems to make the box plots seem a bit further apart and easier to read.

ggplot(data = diamonds)+
  geom_bar(mapping = aes(x=cut, fill = cut))+
  coord_flip()
### a good bar graph which is visually aesthetic with different colors separating the classes of the variable and has a clear legend on the left side.


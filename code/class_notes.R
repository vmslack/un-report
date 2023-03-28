library(tidyverse)

### look at your variable information using these functions
gapminder_1997 <- read.csv("gapminder_1997.csv")
str(gapminder_1997)

### look at help panel (i.e. new pkg) all options available, etc.
?read_csv

### what's the date
Sys.Date()

### to find where you are / working directory
getwd()

### arithmetics
sum(5, 6)
round(3.1415, 3)
round(x = 3.1415, digits = 2)


### ggplot needs the + sign to build on - the process
ggplot(data = gapminder_1997) + 
  aes(x = gdpPercap) +
  labs(x = "GDP Per Capita") + #change the label name
  aes(y = lifeExp) +
  labs(y = "Life Expectancy") +
  geom_point() +
  labs(title = "Do people in wealthy countries live longer?") +
  aes(color = continent) +
  scale_color_brewer(palette = "Set1") +
  aes(size = pop/1000000) + ###map out population to size comparison
  labs(size = "Population (in millions)")
  

### or write it condensed with less code ! 
ggplot(data = gapminder_1997) +
  aes(x = gdpPercap, y = lifeExp, 
      color = continent, 
      size = pop/1000000) + 
  geom_point() +
  scale_color_brewer(palette = "Set1") +
  labs(x = "GDP Per Capita", y = "Life Expectancy",
       title = "Do people in wealthy countries live longer?",
       size = "Population (in millions)")

# Plotting for data exploration 
# load in a larger dataset
gapminder_data <- read.csv("gapminder_data.csv")

dim(gapminder_data)

ggplot(data = gapminder_data) +
  aes(x = year, y = lifeExp, 
      group = country, 
      color = continent) + 
  geom_line()
#other geom options are geom_point for scatter

# Discrete plots
ggplot(data = gapminder_1997) + 
  aes(x = continent, y = lifeExp) +
  geom_boxplot()

ggplot(data = gapminder_1997) + 
  aes(x = continent, y = lifeExp) +
  geom_violin() +
  geom_point() #add another layer or 2nd graph 

ggplot(data = gapminder_1997) + 
  aes(x = continent, y = lifeExp) +
  geom_jitter() +
  geom_violin()  ### order matters here b/c the jitter pts are covered by violin

  #add script to the ()'s for specific attribution
ggplot(data = gapminder_1997, aes(x = continent, y = lifeExp)) + 
  geom_violin() +
  geom_jitter(aes(size = pop), color = "pink") 

  # move the color around to show example of moving the color
ggplot(data = gapminder_1997, aes(x = continent, y = lifeExp)) + 
  geom_violin(fill = "pink")  #b/c if said color='pink' it would be outline

  # two different ways to fill in continent violins
ggplot(data = gapminder_1997, aes(x = continent, y = lifeExp)) + 
  geom_violin(aes(fill = continent))
ggplot(data = gapminder_1997, aes(x = continent, y = lifeExp)) + 
  geom_violin(fill = "springgreen") #remove aes to assign one color


# Univariate plots

ggplot(gapminder_1997) +
  aes(x = lifeExp) +
  geom_histogram(bins = 15)

# Plot themes

ggplot(gapminder_1997) +
  aes(x = lifeExp) + 
  geom_histogram(bins = 20) + 
  theme_linedraw() +
  theme(axis.text.x = element_text(angle = 90, 
                                   vjust = 0.5, 
                                   hjust = 1))

# facet wrap

ggplot(gapminder_1997) +
  aes(x = gdpPercap, y = lifeExp) +
  geom_point() + 
  facet_wrap(vars(continent))
  
# facet grid
ggplot(gapminder_1997) +
  aes(x = gdpPercap, y = lifeExp) +
  geom_point() + 
  facet_grid(rows = vars(continent))


### SAVE YOUR PLOTS 
ggsave("awesome_plot.jpg", width = 6, height = 4)


#another way (it also shows up in Env't window to the right: 
awesome_plot <- ggplot(gapminder_1997) +
  aes(x = gdpPercap, y = lifeExp) +
  geom_point() + 
  facet_grid(rows = vars(continent))

# to view object, just type it 
awesome_plot

ggsave(awesome_plot, 
       file = "awesome_plot.jpg", 
       width = 6, height = 4)


### Assignment (part one, layer it)
# ggplot(data = gapminder_1997) +
  # aes(x = continent) + 
  # aes(y = lifeExp) + 
  # geom_violin(aes(fill = continent))

### part two, shorter code ? 
violin_plot <- ggplot(data = gapminder_1997, 
                      aes(x = continent, 
                          y = lifeExp)) +
  geom_violin(aes(fill = continent)) + #can do 'color' instead of fill
  theme_bw()

violin_plot

# save it 

ggsave(violin_plot, 
       file = "awesome_violin_plot.jpg", 
       width = 6, height = 4)


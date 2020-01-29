gm_url <- 
  "https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/_episodes_rmd/data/gapminder_data.csv"
download.file(gm_url, destfile = "data/gapminder_data.csv")

gapminder <- read.csv("data/gapminder_data.csv")
head(gapminder)

condition <- FALSE
if (condition) {
  
  print(TRUE)
  
} else if (condition){
  
  print(c(FALSE, "BUT"))
  
} else {
  
  print(FALSE)
  
}

if (nrow(gapminder) > 100) {
  
  print("it's big!!")
  
}

if ("birthTate" %in% colnames(gapminder)) {
  
  lm(birthRate ~ pop, data = gapminder)
  
} else if ("avfHeight" %in% colnames(gapminder)) {
  
  lm(avgHeight ~ pop, data = gapminder) 
  
} else {
  
  lm(lifeExp ~ pop, data = gapminder)
  ggplot(data=gapminder[gapminder$continent == "Europe" & gapminder$pop > 50000000,], mapping = aes(x=lifeExp, y=pop, by = country, color = country)) +
    geom_point()
}

if ("2012" %in% gapminder$year) {print(TRUE)} else {print(FALSE)}

for (i in 1:3) {
  print(gapminder[i,])
}

newResult <- list()
for (i in c(10, 25, 50)) {
  for (j in c('a', 'b', 'c', 'd')){
    
    current_name <- paste(i,j)
    newResult[current_name] <- rnorm(1)
    
  }
}

for (i in unique(gapminder$continent)) {
  print(i)
  continentList <- gapminder[gapminder$continent == i,]
  for (j in unique(continentList$country)) {
    print(paste0("--> ", j))
  }
}

yearChoice <- 1952
for (i in unique(gapminder$continent)) {
  contData <- mean(gapminder[gapminder$continent == i & gapminder$year == yearChoice,]$lifeExp)
  print(paste(i, round(contData,1), yearChoice))
  if (contData > 50) {
    print("--> LifeExp greater than 50")
  } else {
    print("--> LifeExp equal to or less than 50")
  }
}

# WRITING OUR OWN FUNCTIONS

# Convert F* to Kelvin temperatures
FtoK <- function(Fd) {
  
  Kd <- ((Fd-32)*(5.0/9.0)) + 273.15
  if (any(Kd < 0)) {
    warning("Physics Failiure")
    stop()
  }
  return(Kd)
}

# Convert Kelvin to C* temperatures
KtoC <- function(Kd) {
  if (any(Kd < 0)) {
    warning("Physics Failiure")
    stop()
  }
  Cd <- Kd - 273.15
  return(Cd)
}

FtoC <- function(Fd) {
  return(KtoC(FtoK(Fd)))
}

calculateGDP <- function(dfSelect) {
  gdp <- dfSelect$pop * dfSelect$gdpPercap
  return(gdp)
}


## DPLYR
library(dplyr)
library(ggplot2)
gapminder %>% calculateGDP()
gapminder %>% group_by(continent) %>% mutate(GDP = gdpPercap * pop) -> gapminder_plus

gapminder_plus %>% group_by(continent) %>% summarise(meanGDP = mean(GDP))

gapminder_plus %>% select(country, lifeExp)

gapminder_plus %>% filter(year == 2002, continent == "Europe") %>% head()

gapminder_plus %>% group_by(country) %>% count()

gapminder_plus %>% sample_n(20, replace = TRUE) %>% count()

gapminder_plus %>% group_by(continent, year) %>% mutate(meanGDPofContinentThisYear = mean(GDP)) ->
  gapminder_plus

gapminder_plus %>% select(-continent, -lifeExp, -gdpPercap)

gapminder_plus %>% filter(gdpPercap < 0.5 * mean(gdpPercap)) %>% ggplot(mapping = aes(x = year, y = lifeExp, by = country, color = continent)) +
  geom_line()

  
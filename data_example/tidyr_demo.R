
# Ch.12: tidy data

rm( list = ls() )

library(tidyverse)


d0 = readr::read_csv("PWT100.csv", col_names = TRUE)
head(d0)
colnames(d0)

arrange(d0, year)


# work with a smaller dataset

d1 <- select(d0, countrycode, year, rgdpe, pop) %>%
  filter(countrycode %in% c("CHN", "RUS", "JPN", "USA")) %>%
  mutate(gdpc = rgdpe/pop)
  

d1 %>% 
  ggplot() + 
  geom_point(mapping = aes(x = year, y = rgdpe, color = countrycode))



s1 <- d1 %>% 
  select( countrycode, year, pop) %>%
  spread( key = year, value = pop)


g1 <- s1 %>% gather('1950':'2019', key = "year", value = "pop")



######################


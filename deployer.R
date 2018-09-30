
install.packages("dplyr")

library(dplyr)
dplyr::filter(mtcars, mpg > 25)

dplyr::filter(mtcars, mpg > 30 & am==1)

mtcars %>% filter(mpg>25 & am==1) #%>% piping 

mtcars %>% filter(mpg >25 & am==1) %>% arrange(wt) %>% summarise(n())

mtcars %>% group_by(am) %>% summarise(mean(mpg))

mtcars %>% group_by(gear) %>% summarise(mean(wt))

mtcars %>% select(mpg,gear) 

slice(mtcars, 10:n())

filter(mtcars , between(row_number() ,5 , n()-2))

?slice

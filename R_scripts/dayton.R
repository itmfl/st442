daytona_plot <- function(){
library(tidyverse)

DAY <- read_table("./datasets/OHDAYTON.txt", col_names = FALSE)
names(DAY) <- c("Month", "Day", "Year", "Temp")
DAY <- select(DAY, "Year", "Month", "Day", "Temp")
# create dataframe that represents 1995-2013 historical data
Past <- DAY %>%
  group_by(Year) %>%
  mutate(newDay = seq(1, length(Day))) %>%          
  ungroup() %>%
  filter(Temp != -99 & Year != 2014) %>%     
  group_by(newDay) %>%
  mutate(upper = max(Temp), # identify max value for each day
         lower = min(Temp), # identify min value for each day
         avg = mean(Temp),  # calculate mean value for each day
         se = sd(Temp)/sqrt(length(Temp))) %>%  
  mutate(avg_upper = avg+(2.101*se),  
         avg_lower = avg-(2.101*se)) %>%  
  ungroup()

# create dataframe that represents current year data
Present <- DAY %>%
  group_by(Year, Month) %>%
  arrange(Day, .by_group = TRUE) %>%
  ungroup() %>%
  group_by(Year) %>%
  mutate(newDay = seq(1, length(Day))) %>%  
  ungroup() %>%
  filter(Temp != -99 & Year == 2014)  

# create dataframe that represents the lowest temp for each day for the historical data
PastLows <- Past %>%
  group_by(newDay) %>%
  summarise(Pastlow = min(Temp)) # identify lowest temp for each day from 1995-2013

# create dataframe that identifies the days in 2014 in which the temps were lower than all previous 19 years
PresentLows <- Present %>%
  left_join(PastLows) %>%  
  mutate(record = ifelse(Temp<Pastlow, "Y", "N")) %>% 
  filter(record == "Y")  

# create dataframe that represents the highest temp for each day for the historical data
PastHighs <- Past %>%
  group_by(newDay) %>%
  summarise(Pasthigh = max(Temp))  

# create dataframe that identifies the days in 2014 in which the temps were higher than all previous 19 years
PresentHighs <- Present %>%
  left_join(PastHighs) %>%  
  mutate(record = ifelse(Temp>Pasthigh, "Y", "N")) %>% 
  filter(record == "Y") 

dgr_fmt <- function(x, ...) {
  parse(text = paste(x, "*degree", sep = ""))
}

# create y-axis variable
a <- dgr_fmt(seq(-20,100, by=10))

# create a small dataframe to represent legend symbol for 2014 Temperature
legend_data <- data.frame(x=seq(178,185),y=rnorm(8,15,2))

p <- ggplot(Past, aes(newDay, Temp)) + 
  theme(plot.background = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid.major = element_blank(),
        panel.border = element_blank(),
        panel.background = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank()) +
  geom_linerange(Past, mapping=aes(x=newDay, ymin=lower, ymax=upper), colour = "wheat2", alpha=.1)

p <- p + geom_linerange(Past, mapping=aes(x=newDay, ymin=avg_lower, ymax=avg_upper), colour = "wheat4")

p <- p +  geom_line(Present, mapping=aes(x=newDay, y=Temp, group=1)) +
  geom_vline(xintercept = 0, colour = "wheat4", linetype=1, size=1)

# p <- p + geom_hline(yintercept = -20, colour = "white", linetype=1) +
#     geom_hline(yintercept = -10, colour = "white", linetype=1) +
#     geom_hline(yintercept = 0, colour = "white", linetype=1) +
#     geom_hline(yintercept = 10, colour = "white", linetype=1) +
#         geom_hline(yintercept = 20, colour = "white", linetype=1) +
#         geom_hline(yintercept = 30, colour = "white", linetype=1) +
#         geom_hline(yintercept = 40, colour = "white", linetype=1) +
#         geom_hline(yintercept = 50, colour = "white", linetype=1) +
#         geom_hline(yintercept = 60, colour = "white", linetype=1) +
#         geom_hline(yintercept = 70, colour = "white", linetype=1) +
#         geom_hline(yintercept = 80, colour = "white", linetype=1) +
#         geom_hline(yintercept = 90, colour = "white", linetype=1) +
#         geom_hline(yintercept = 100, colour = "white", linetype=1)

p <- p + geom_vline(xintercept = 31, colour = "wheat4", linetype=3, size=.5) +
  geom_vline(xintercept = 59, colour = "wheat4", linetype=3, size=.5) +
  geom_vline(xintercept = 90, colour = "wheat4", linetype=3, size=.5) +
  geom_vline(xintercept = 120, colour = "wheat4", linetype=3, size=.5) +
  geom_vline(xintercept = 151, colour = "wheat4", linetype=3, size=.5) +
  geom_vline(xintercept = 181, colour = "wheat4", linetype=3, size=.5) +
  geom_vline(xintercept = 212, colour = "wheat4", linetype=3, size=.5) +
  geom_vline(xintercept = 243, colour = "wheat4", linetype=3, size=.5) +
  geom_vline(xintercept = 273, colour = "wheat4", linetype=3, size=.5) +
  geom_vline(xintercept = 304, colour = "wheat4", linetype=3, size=.5) +
  geom_vline(xintercept = 334, colour = "wheat4", linetype=3, size=.5) +
  geom_vline(xintercept = 365, colour = "wheat4", linetype=3, size=.5) 

p <- p + coord_cartesian(ylim = c(-20,100)) +
  scale_y_continuous(breaks = seq(-20,100, by=10), labels = a) +
  scale_x_continuous(expand = c(0, 0),                       breaks=c(15,45,75,105,135,165,195,228,258,288,320,350),
                     labels = c("Jan", "Feb", "Mar", "Apr",
                                "May", "June", "July", "Aug", "Sep",
                                "Oct", "Nov", "Dec"))

p <- p +
  geom_point(data=PresentLows, aes(x=newDay, y=Temp), colour="blue3") +
  geom_point(data=PresentHighs, aes(x=newDay, y=Temp), colour="firebrick3")

p <- p +
  ggtitle("Dayton's Weather in 2014") +
  theme(plot.title=element_text(face="bold",hjust=.012,vjust=.8,colour="#3C3C3C",size=20)) +
  annotate("text", x = 119, y = 98, label = "Temperature", size=4, fontface="bold")

p <- p +
  annotate("text", x = 126, y = 93, 
           label = "Data represents average daily temperatures. Accessible data dates back to", size=3, colour="gray30") +
  annotate("text", x = 122, y = 89, 
           label = "January 1, 1995. Data for 2014 is only available through December 16.", size=3, colour="gray30") +
  annotate("text", x = 124, y = 85, 
           label = "Average temperature for the year was 51.9° making 2014 the 9th coldest", size=3, colour="gray30") +
  annotate("text", x = 128, y = 81, label = "year since 1995", size=3, colour="gray30")

p <- p +
  annotate("segment", x = 30, xend = 40, y = -5, yend = -10, colour = "blue3") +
  annotate("text", x = 65, y = -10, label = "We had 35 days that were the", size=3, colour="blue3") +
  annotate("text", x = 56, y = -14, label = "coldest since 1995", size=3, colour="blue3") +
  annotate("segment", x = 302, xend = 307, y = 74, yend = 82, colour = "firebrick3") +
  annotate("text", x = 333, y = 92, label = "We had 19 days that were the", size=3, colour="firebrick3") +
  annotate("text", x = 324, y = 88, label = "hottest since 1995", size=3, colour="firebrick3")

p <- p +
  annotate("segment", x = 181, xend = 181, y = 5, yend = 25, colour = "wheat2", size=3) +
  annotate("segment", x = 181, xend = 181, y = 12, yend = 18, colour = "wheat4", size=3) +
  geom_line(data=legend_data, aes(x=x,y=y)) +
  annotate("segment", x = 183, xend = 185, y = 17.7, yend = 17.7, colour = "wheat4", size=.5) +
  annotate("segment", x = 183, xend = 185, y = 12.2, yend = 12.2, colour = "wheat4", size=.5) +
  annotate("segment", x = 185, xend = 185, y = 12.2, yend = 17.7, colour = "wheat4", size=.5) +
  annotate("text", x = 205, y = 14.75, label = "NORMAL RANGE", size=2, colour="gray30") +
  annotate("text", x = 152, y = 14.75, label = "2014 TEMPERATURE", size=2, colour="gray30") +
  annotate("text", x = 205, y = 25, label = "RECORD HIGH", size=2, colour="gray30") +
  annotate("text", x = 205, y = 5, label = "RECORD LOW", size=2, colour="gray30")
return(p)
}

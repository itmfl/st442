hotdogs_plot <- function(){
library(mdsr)
hd <- readr::read_csv(
  "./datasets/hot-dog-contest-winners.csv")
names(hd) <- gsub(" ", "_", names(hd)) %>% tolower()

new_data <- data.frame(
  year = c(1979, 1978, 1974, 1972, 1916), 
  winner = c(NA, "Walter Paul", NA, NA, "James Mullen"),
  dogs_eaten = c(19.5, 17, 10, 14, 13),
  country = rep(NA, 5), new_record = c(1,1,0,0,0)
)
hd <- bind_rows(hd, new_data)

xlabs <- c(1916, 1972, 1980, 1990, 2007)
ylabs <- seq(from = 0, to = 70, by = 10)

hd_plot <- hd %>% filter(year < 2008)
p <- ggplot(data = hd_plot, aes(x = year, y = dogs_eaten)) +
  geom_bar(stat = "identity")
p
ticks_y <- data.frame(x = 1912, y = ylabs)

text <- bind_rows(
  # Frank Dellarosa
  data.frame(x = 1951.5, y = 37, 
    label = paste("Frank Dellarosa eats 21 and a half HDBs over 12\n",
      "minutes, breaking the previous record of 19 and a half."), adj = 0),
  # Joey Chestnut
  data.frame(x = 1976.5, y = 69, 
    label = paste("For the first time since 1999, an American\n",
      "reclaims the title when Joey Chestnut\n",
      "consumes 66 HDBs, a new world record."), adj = 0), 
  # Kobayashi
  data.frame(x = 1960.5, y = 55, 
    label = paste("Through 2001-2005, Takeru Kobayashi wins by no less\n",
      "than 12 HDBs. In 2006, he only wins by 1.75. After win-\n",
      "ning 6 years in a row and setting the world record 4 times,\n",
      "Kobayashi places second in 2007."), adj = 0),
  # Walter Paul
  data.frame(x = 1938, y = 26, label = "Walter Paul sets a new
world record with 17 HDBs.", adj = 0),
  # James Mullen
  data.frame(x = 1917, y = 10, label = "James Mullen wins the inaugural
contest, scarfing 13 HDBs. Length
of contest unavailable.", adj = 0), 
  data.frame(x = 1935, y = 72, label = "NEW WORLD RECORD"),
  data.frame(x = 1914, y = 72, label = "Hot dogs and buns (HDBs)"),
#  data.frame(x = 1940, y = 2, 
#    label = "*Data between 1916 and 1972 were unavailable"), 
#  data.frame(x = 1922, y = 2, label = "Source: FlowingData")
)

segments <- bind_rows(
  data.frame(x = c(1984, 1991, 1991, NA), y = c(37, 37, 21, NA)),
  data.frame(x = c(2001, 2007, 2007, NA), y = c(69, 69, 66, NA)), 
  data.frame(x = c(1995, 2006, 2006, NA), y = c(58, 58, 53.75, NA)),
  data.frame(x = c(2005, 2005, NA), y = c(58, 49, NA)),
  data.frame(x = c(2004, 2004, NA), y = c(58, 53.5, NA)),
  data.frame(x = c(2003, 2003, NA), y = c(58, 44.5, NA)),
  data.frame(x = c(2002, 2002, NA), y = c(58, 50.5, NA)),
  data.frame(x = c(2001, 2001, NA), y = c(58, 50, NA)),
  data.frame(x = c(1955, 1978, 1978), y = c(26, 26, 17)))

p <- p + geom_bar(stat = "identity", aes(fill = factor(new_record))) +
  geom_hline(yintercept = 0, color = "darkgray") + 
  scale_fill_manual(name = NULL, 
    values = c("0" = "#006f3c", "1" = "#81c450")) +
  scale_x_continuous(name = NULL, breaks = xlabs, minor_breaks = NULL, 
    limits = c(1912, 2008), expand = c(0, 1)) +
  scale_y_continuous(name = NULL, breaks = ylabs, labels = NULL, 
    minor_breaks = NULL, expand = c(0.01, 1)) + 
  geom_text(data = ticks_y, aes(x = x, y = y + 2, label = y), size = 3) +
  ggtitle("Winners from Nathan's hot dog eating contest") +
  geom_text(data = text, aes(x = x, y = y, label = label), 
    hjust = "left", size = 3) +
  geom_path(data = segments, aes(x = x, y = y), col = "darkgray") + 
  # Key
  geom_rect(xmin = 1933, ymin = 70.75, xmax = 1934.3, ymax = 73.25, 
    fill = "#81c450", color = "white") + 
  guides(fill = FALSE) + 
  theme(panel.background = element_rect(fill = "white"),
    panel.grid.major.y = element_line(color = "gray", linetype = "dotted"),
    plot.title = element_text(size = rel(2)),
    axis.ticks.length = unit(0, "cm")) +
labs(caption = "Source: Flowing Data      *Data between 1916 and 1972 were unavailable") 

return(p)
}

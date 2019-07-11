napoleon_plot <- function(){
library(tidyverse)
library(lubridate)
library(ggmap)
library(ggrepel)
library(gridExtra)
library(pander)

cities <- read.table("./napoleon_fig/cities.txt",
                     header = TRUE, stringsAsFactors = FALSE)

troops <- read.table("./napoleon_fig/troops.txt",
                     header = TRUE, stringsAsFactors = FALSE)

temps <- read.table("napoleon_fig/temps.txt",
                    header = TRUE, stringsAsFactors = FALSE) %>%
                    mutate(date = dmy(date))  

march.1812.plot.simple <- ggplot() +
  geom_path(data = troops, aes(x = long, y = lat, group = group, 
                               color = direction, size = survivors),
            lineend = "round") +
  geom_point(data = cities, aes(x = long, y = lat),
             color = "#DC5B44") +
  geom_text_repel(data = cities, aes(x = long, y = lat, label = city),
                  color = "#DC5B44") +
  scale_size(range = c(0.5, 10)) + 
  scale_colour_manual(values = c("#DFC17E", "#252523")) +
  guides(color = FALSE, size = FALSE) +
  theme_nothing()

temps.nice <- temps %>%
  mutate(nice.label = paste0(temp, "°, ", month, ". ", day))

# Change the x-axis limits to match the simple map
temps.1812.plot <- ggplot(data = temps.nice, aes(x = long, y = temp)) +
  geom_line() +
  geom_label(aes(label = nice.label), size = 2.5) + 
  labs(x = NULL, y = "° Celsius") +
  scale_x_continuous(limits = ggplot_build(march.1812.plot.simple)$layout$panel_ranges[[1]]$x.range) +
  scale_y_continuous(position = "right") +
  coord_cartesian(ylim = c(-35, 5)) +  # Add some space above/below
  #theme_bw(base_family = "Open Sans Condensed Light") +
  theme(panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.minor.y = element_blank(),
        axis.text.x = element_blank(), axis.ticks = element_blank(),
        panel.border = element_blank())

# Combine the two plots
both.1812.plot.simple <- gtable_rbind(ggplotGrob(march.1812.plot.simple),
                               ggplotGrob(temps.1812.plot))

# Adjust panels
panels <- both.1812.plot.simple$layout$t[grep("panel", both.1812.plot.simple$layout$name)]

# Because this plot doesn't use coord_equal, since it's not a map, we can use whatever relative numbers we want, like a 3:1 ratio
both.1812.plot.simple$heights[panels] <- unit(c(5, 2), "null")
return(both.1812.plot.simple)

}
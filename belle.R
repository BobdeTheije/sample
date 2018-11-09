library("ggplot2")

setwd("C:/Users/Bob/Documents/coursera/data/belle")

belle <- read.csv("belle.csv")

belle$Datum <- as.Date(belle$Datum, "%m/%d/%Y")

g <- ggplot(belle, aes(Datum)) + 
    geom_line(aes(y = Gewicht , colour = "gewicht")) + 
    geom_line(aes(y = half, colour = "half")) +
    geom_line(aes(y = heel, colour = "heel")) + 
    geom_line(aes(y = half_nw, colour = "half_nw")) +
    geom_line(aes(y = heel_nw, colour = "heel_nw")) + 
    geom_hline(yintercept = 50, colour = "green") + 
    geom_hline(yintercept = 46, colour = "yellow") + 
    geom_hline(yintercept = 45, colour = "dark grey") + 
    scale_x_date(date_breaks = "1 week", date_labels = "%b %d") +
    scale_y_continuous(breaks=c(39,40,41,42,43,44,45,46,47,48,49,50))

print(g)

dev.copy(png, file = "belle.png", width=3600, height=600)  ## Copy my plot to a PNG file

dev.off()
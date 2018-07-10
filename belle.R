library("ggplot2")

belle <- read.csv("belle.csv")

belle$Datum <- as.Date(belle$Datum, "%m/%d/%Y")

g <- ggplot(belle, aes(Datum)) + 
    geom_line(aes(y = Gewicht , colour = "gewicht")) + 
    geom_line(aes(y = half, colour = "half")) +
    geom_line(aes(y = heel, colour = "heel")) + 
    geom_hline(yintercept = 50, colour = "green") + 
    scale_x_date(date_breaks = "1 week", date_labels = "%b %d")

print(g)

dev.copy(png, file = "belle.png", width=3600, height=600)  ## Copy my plot to a PNG file

dev.off()
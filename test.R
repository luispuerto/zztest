local({
  a <- commandArgs(TRUE)
  print(a)
}
)


data <- read.csv("~/Downloads/data.csv")

data4plot <- data.frame(week = data$year_week[data$country == "Switzerland" & data$indicator == "cases"],
                        CH = data$rate_14_day[data$country == "Switzerland" & data$indicator == "cases"],
                        ES = data$rate_14_day[data$country == "Spain" & data$indicator == "cases"],
                        UK = data$rate_14_day[data$country == "United Kingdom" & data$indicator == "cases"])

data4plot[is.na(data4plot$ES), c("ES", "CH")] <- 0

plot(tail(data4plot$CH, 5), type = "l", col = "red", ylim = c(0, 350), 
     xlab = "semanas", ylab = "incicencia/100000 hab", xaxt = "n")

lines(tail(data4plot$ES, 5), type = "l", col = "green")
lines(tail(data4plot$UK, 5), type = "l", col = "blue")
axis(1, at = 1:5, labels = tail(data4plot$week, 5), las = 2)




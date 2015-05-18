
df <- read.csv("stats.csv", sep=";", comment.char="#")
df$date <- as.Date(df$date, "%d.%m.%Y")
df

# attach(mtcars)
# par(mfrow=c(2,1))
# plot(total.km ~ date, df, xaxt="n", type="l", col="red")
# axis(1, df$date, format(df$date, "%b %Y"), cex.axis = .7)
# plot(km.day ~ date, df, xaxt="n", type="l", col="blue")
# axis(1, df$date, format(df$date, "%b %Y"), cex.axis = .7)

library(ggplot2)


png("r_stats_%d.png", width=1280, height=720, res=120)

ggplot(df, aes(x=date, y=total.km, group=bike, color=bike)) +
      geom_point() +
      geom_line()

ggplot(df, aes(x=date, y=km.day, group=bike, color=bike)) +
      geom_point() +
      geom_smooth(aes(group=bike), method="lm", se=FALSE)


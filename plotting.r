# --- reading, converting
df <- read.csv("stats.csv", sep=";", dec=".", comment.char="#")

df$date <- as.Date(df$date, "%d.%m.%Y")
df$km.day <- as.numeric(as.character(df$km.day))
df$V_mean <- as.numeric(as.character(df$V_mean))
df$V_max <- as.numeric(as.character(df$V_max))

# ..debug data..
# lapply(df, class)
# str(df)
# which(is.na(df$V_max))

# --- plotting
library(ggplot2)

png("r_stats_%d.png", width=2000, height=800, res=120)

ggplot(df, aes(x=date, y=total.km, group=bike, color=bike)) +
      geom_point() +
      geom_line()

ggplot(df, aes(x=date, y=km.day, group=bike, color=bike)) +
      geom_point() +
      geom_area() +
      scale_y_continuous(limit=c(0, 200))
#       expand_limits(y=c(0, 200))
#      geom_smooth(aes(group=bike), method="lm", se=FALSE)


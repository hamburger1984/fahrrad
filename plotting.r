# --- reading, converting
library(lubridate)

df <- read.csv("stats.csv", sep=";", dec=".", comment.char="#")

df$date <- as.Date(df$date, "%d.%m.%Y")
df$km.day <- as.numeric(as.character(df$km.day))
df$time.day <- hms(df$time.day)
df$time.day.total_hours <- period_to_seconds(df$time.day)/3600
df$V_mean <- as.numeric(as.character(df$V_mean))
df$V_max <- as.numeric(as.character(df$V_max))
df$total.time <- hms(df$total.time)
df$total.time.total_hours <- period_to_seconds(df$total.time)/3600

# ..debug data..
#lapply(df, class)
#str(df)
#which(is.na(df$V_max))

# --- plotting
library(ggplot2)

png("r_stats_%d.png", width=2000, height=800, res=120)

ggplot(df, aes(x=date, y=total.km, group=bike, color=bike)) +
      geom_point() +
      geom_line()

ggplot(df, aes(x=date, y=total.time.total_hours, group=bike, color=bike)) +
      geom_point() +
      geom_line()

ggplot(df, aes(x=date, y=km.day, group=bike, color=bike)) +
      geom_point() +
      geom_area()

ggplot(df, aes(x=date, y=time.day.total_hours, group=bike, color=bike)) +
      geom_point() +
      geom_area()

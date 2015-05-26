# --- reading, converting
library(lubridate)

df <- read.csv("stats.csv", sep=";", dec=".", comment.char="#")

df$date <- as.Date(df$date, "%d.%m.%Y")
df$day <- wday(df$date, label=TRUE)
df$year <- format(df$date, "%Y")
df$year_month <- format(df$date, "%Y-%m")
df$km.day <- as.numeric(as.character(df$km.day))
df$time.day <- hms(df$time.day)
df$time.day.hours <- period_to_seconds(df$time.day)/3600
df$V_mean <- as.numeric(as.character(df$V_mean))
df$V_max <- as.numeric(as.character(df$V_max))
df$total.time <- hms(df$total.time)
df$total.time.hours <- period_to_seconds(df$total.time)/3600

# ..debug data..
#lapply(df, class)
#str(df)
#which(is.na(df$V_max))

# --- plotting
library(ggplot2)

png("stats_%d.png", width=2200, height=1000, res=120)

ggplot(df, aes(x=date, y=total.km, group=bike, color=bike, fill=bike)) +
      geom_point() +
      geom_line(alpha=.35) +
      ggtitle("Total distance") +
      labs(x="Date", y="Total distance\n(km)") +
      facet_wrap(bike~year, scales="free")

ggplot(df, aes(x=date, y=total.time.hours, group=bike, color=bike, fill=bike)) +
      geom_point() +
      geom_line(alpha=.35) +
      ggtitle("Total time") +
      labs(x="Date", y="Total time\n(hours)") +
      facet_wrap(bike~year, scales="free")

ggplot(df, aes(x=date, y=km.day, group=bike, color=bike, fill=bike)) +
      geom_point() +
      geom_area(alpha=.35) +
      ggtitle("Daily distance") +
      labs(x="Date", y="Distance\n(km)") +
      facet_wrap(bike~year, scales="free_x")

ggplot(df, aes(x=date, y=time.day.hours, group=bike, color=bike, fill=bike)) +
      geom_point() +
      geom_area(alpha=.35) +
      ggtitle("Daily time") +
      labs(x="Date", y="Time\n(hours)") +
      facet_wrap(bike~year, scales="free_x")

ggplot(df, aes(day, km.day, fill=bike)) +
      geom_violin(adjust=.75) +
      ggtitle("Daily distance by day of week") +
      labs(x="Day of week", y="Distance\n(km)") +
      facet_wrap(bike~year)

ggplot(df, aes(day, time.day.hours, fill=bike)) +
      geom_violin(adjust=.75) +
      ggtitle("Daily time by day of week") +
      labs(x="Day of week", y="Time\n(hours)") +
      facet_wrap(bike~year)

SOURCES=plotting.r stats.csv
PLOTS=stats_1.png stats_2.png stats_3.png stats_4.png stats_5.png stats_6.png stats_7.png stats_8.png

all: $(PLOTS)

$(PLOTS): plotting.r stats.csv
	R --vanilla --slave -f plotting.r
#	R --vanilla -f plotting.r

clean:
	rm $(PLOTS)

set term pngcairo truecolor enhanced size 1000,600 font "arial,9"
set output 'stats.png'

set multiplot

##set key below
set key above

set xdata time
set timefmt '%d.%m.%Y'
unset grid
set xtics format '%d. %b %Y' rotate by -45 autofreq tc rgb '#555555'
set ytics
set y2tics 10,20 tc rgb '#009900'

unset mxtics
set grid ytics lt 0 lw 1 lc rgb 'black'

set datafile separator ';'
set datafile commentschars '#!%'

set autoscale
set yrange [0:]
set y2range [0:]
set xrange ['21.5.2013':]

set boxwidth 20000 
set style fill transparent solid 0.33 noborder

plot 'stats.csv' using 1:6 notitle axes x1y2 w filledcu y1=0 lc rgb '#009900', \
  '' using 1:6 title 'total distance [km]' axes x1y2 w lp pt 6 ps 2 lw 2 lc rgb '#009900', \
  '' using 1:2 title 'distance per day [km]' w boxes lc rgb 'blue', \
  '' using 1:5:4 notitle w filledcu lc rgb 'light-goldenrod', \
  '' using 1:5 title 'V_{max} [km/h]' w lp pt 8 ps 2 lw 2 lc rgb 'red', \
  '' using 1:4 title 'V_{mean} [km/h]' w lp pt 10 ps 2 lw 2 lc rgb 'gold'

unset grid
set grid y2tics lt 0 lw 1 lc rgb '#009900'
replot

unset multiplot

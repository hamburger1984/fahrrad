set term png truecolor enhanced size 1000,600 font ",9"
set output 'stats.png'

set key below
set grid

set xdata time
set timefmt '%d.%m.%Y'
set xtics format '%d. %b %Y' 
set xtics rotate by -45 autofreq
set xtics tc rgb '#555555'
set ytics
set y2tics tc rgb '#009900'

set datafile separator ';'
set datafile commentschars '#!%'

set autoscale
set yrange [0:]
set xrange ['21.5.2013':]

set boxwidth 20000 
set style fill transparent solid 0.5 noborder

plot 'stats.csv' using 1:6 notitle axes x1y2 w filledcu y1=0 lc rgb '#009900', \
  '' using 1:6 title 'total distance [km]' axes x1y2 w lp lw 2 lc rgb '#009900', \
  '' using 1:5:4 notitle w filledcu lw 2 lc rgb 'light-goldenrod', \
  '' using 1:5 title 'V_{max} [km/h]' w lp lw 2 lc rgb 'red', \
  '' using 1:4 title 'V_{mean} [km/h]' w lp lw 2 lc rgb 'gold', \
  '' using 1:2 title 'distance per day [km]' w boxes lw 2 lc rgb 'blue'

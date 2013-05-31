set term pngcairo dashed truecolor enhanced size 1000,600 font "arial,9"
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
set style data linespoints

plot maxsum = 0, meansum = 0, \
  'stats.csv' u 1:6 notitle axes x1y2 w filledcu y1=0 lc rgb '#009900', \
  '' u 1:6 title 'total distance [km]' axes x1y2 lt 1 lw 2 ps 2 pt 6 lc rgb '#009900', \
  '' u 1:2 title 'distance per day [km]' w boxes lc rgb 'blue', \
  '' u 1:5:4 notitle w filledcu lc rgb 'light-goldenrod', \
  '' u 1:5 title 'V_{max} [km/h]' lt 1 lw 2 ps 2 pt 8 lc rgb 'red', \
  '' u 1:4 title 'V_{mean} [km/h]' lt 1 lw 2 ps 2 pt 10 lc rgb 'gold', \
  '' u 1:(maxsum = maxsum+$5, maxsum/($0+1)) notitle w l smooth sbezier lt 3 lc rgb 'red', \
  '' u 1:(meansum = meansum+$4, meansum/($0+1)) notitle w l smooth sbezier lt 3 lc rgb 'gold'

unset grid
set grid y2tics lt 0 lw 1 lc rgb '#009900'
replot

unset multiplot

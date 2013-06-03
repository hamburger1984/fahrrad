set term pngcairo dashed truecolor enhanced size 1000,800 font "arial,9"
set output 'stats.png'

set multiplot layout 2,1

# set key above
set key left box

set xdata time
set timefmt x '%d.%m.%Y'
set xtics nomirror format '' tc rgb '#555555'

set ytics
set ylabel 'Distance [km], Speed [km/h]'

set y2data time
set timefmt y2 '%H:%M:%S'
set y2tics format '%H:%M'
set y2label 'Time [h:m]'

unset grid
unset mxtics
unset mytics
unset my2tics
set grid ytics lt 0 lw 1 lc rgb 'black'
set grid y2tics lt 0 lw 1 lc rgb 'black'

set datafile separator ';'
set datafile commentschars '#!%'

set autoscale
set yrange [0:]
set y2range [0:]
set xrange ['21.5.2013':] writeback
set boxwidth 20000 
set style fill transparent solid 0.5 noborder
set style data linespoints

set title 'Daily and Speed'

#  'stats.csv' u 1:5:4 notitle w filledcu lc rgb 'light-goldenrod', \

plot maxsum = 0, meansum = 0, \
  'stats.csv' u 1:5 title 'V_{max}' w p lw 2 ps 2 pt 8 lc rgb 'red', \
  '' u 1:4 title 'V_{mean}' w p lw 2 ps 2 pt 10 lc rgb 'orange', \
  '' u 1:(maxsum = maxsum+$5, maxsum/($0+1)) notitle w l smooth sbezier lw 2 lt 3 lc rgb 'red', \
  '' u 1:(meansum = meansum+$4, meansum/($0+1)) notitle w l smooth sbezier lw 2 lt 3 lc rgb 'orange', \
  '' u 1:2 title 'distance' lt 0 lw 2 ps 2 pt 6 lc rgb '#009900', \
  '' u 1:3 title 'time' axes x1y2 lt 0 lw 2 ps 2 pt 7 lc rgb 'blue'
 
set title 'Totals'
# unset key
set ylabel 'Distance [km]'
set xtics nomirror format '%d. %b %Y' rotate by -45 autofreq tc rgb '#555555'
set xrange restore

plot 'stats.csv' u 1:6 notitle w filledcu y1=0 lc rgb '#009900', \
  '' u 1:6 title 'distance' lt 1 lw 2 ps 2 pt 6 lc rgb '#009900', \
  '' u 1:7 notitle axes x1y2 w filledcu y1=0 lc rgb 'blue', \
  '' u 1:7 title 'time' axes x1y2 lt 1 lw 2 ps 2 pt 7 lc rgb 'blue'

unset multiplot

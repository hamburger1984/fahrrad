set term png size 1000,600
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

plot 'stats.csv' using 1:6 title 'km total' axes x1y2 with filledcurves y1=0 lc rgb '#009900', \
  '' using 1:2 title 'km/day' w lp lw 2 lc rgb 'blue', \
  '' using 1:5 title 'V_max' w lp lw 2 lc rgb 'red', \
  '' using 1:4 title 'V_mean' w lp lw 2 lc rgb 'gold'

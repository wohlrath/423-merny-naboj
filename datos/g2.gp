#!/usr/bin/gnuplot

set terminal epslatex size 18cm,12cm color colortext
set output 'UI.tex'

set title
set xlabel '$I_m^2$ (\si{\ampere\squared})'
set ylabel '$U$ (\si{\volt})'
set grid x,y
set xrange[0.8:23]
set yrange[150:370]
set key bottom right


alfa2=(3.5/5)**2
#e je v jednotkach 
f40(x)=0.5*0.25*100000*e40*alfa2*(0.04)**2*x      +a1
f60(x)=0.5*0.25*100000*e60*alfa2*(0.06)**2*x      +a2
f80(x)=0.5*0.25*100000*e80*alfa2*(0.08)**2*x      +a3
f100(x)=0.5*0.25*100000*e100*alfa2*(0.10)**2*x    +a4

fit f40(x**2) 'data' u 2:1 via e40    ,a1
fit f60(x**2) 'data' u 4:3 via e60    ,a2
fit f80(x**2) 'data' u 6:5 via e80    ,a3
fit f100(x**2) 'data' u 8:7 via e100  ,a4


plot 'data' u ($2**2):1 pt 2 lw 2 t '$d=\SI{40}{\mm}$', \
	'' u ($4**2):3 pt 2 lw 2 t '$d=\SI{60}{\mm}$', \
	'' u ($6**2):5 pt 2 lw 2 t '$d=\SI{80}{\mm}$', \
	'' u ($8**2):7 pt 2 lw 2 t '$d=\SI{100}{\mm}$', \
	f40(x) ls 1 lw 2 not, \
	f60(x) ls 1 lc 2 lw 2 not, \
	f80(x) ls 1 lc 3 lw 2 not, \
	f100(x) ls 1 lc 4 lw 2 not

set terminal wxt
set output

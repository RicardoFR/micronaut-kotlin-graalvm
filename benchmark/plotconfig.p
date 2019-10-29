# output as png image
set terminal png size 1024

# save file to a file
set output "result.png"

# graph title
set title "Request VS Response time"

# nicer aspect ratio for image size
set size ratio 0.6

# y-axis grid
set grid y

# x-axis label
set xlabel "Peticiones"

# y-axis label
set ylabel "Response Time (ms)"

plot "output.tsv" using 9 smooth sbezier with lines title "App Benchmark"
#!/usr/bin/ruby
temp = `vcgencmd measure_temp`
cpu = `vmstat`
p temp 
p cpu


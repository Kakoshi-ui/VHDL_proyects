transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+dvd_image120x120  -L xil_defaultlib -L secureip -O5 xil_defaultlib.dvd_image120x120

do {dvd_image120x120.udo}

run 1000ns

endsim

quit -force

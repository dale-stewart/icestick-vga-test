all: prog

vga.json: vga.v colorbars.v colors.v
	yosys -q -p 'synth_ice40 -top vga -json vga.json' vga.v colorbars.v colors.v

vga.txt: vga.json vga.pcf
	nextpnr-ice40 -q --hx1k --package tq144 --json vga.json --pcf vga.pcf --asc vga.txt

vga.bin: vga.txt
	icepack vga.txt vga.bin

prog: vga.bin
	iceprog vga.bin

clean:
	rm vga.json vga.txt vga.bin

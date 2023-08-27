
.PHONY: all clean


all: directories primary gui
	$(MAKE) -C modules/minerva

directories:
	@mkdir -p output

primary:
	$(MAKE) -C argon-first-stage

clean:
	$(MAKE) -C argon-first-stage clean
	rm -rf output/

dist: clean all 
	cp output/argon-nx.bin argon-nx.bin
	zip -r argon-nx.zip argon argon-nx.bin

	rm -rf argon
	rm argon-nx.bin
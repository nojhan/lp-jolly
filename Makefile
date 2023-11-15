LP ?= /home/nojhan/code/liquidprompt
HEIGHT := 450
THEME := dotmatrix dotmatrix.theme

ALL := $(addprefix screenshots/,variant-chevron.png variant-round.png variant-slant.png variant-text.png variant-chevron_colors-cyan-magenta.png variant-chevron_colors-green-red.png variant-chevron_colors-high-contrast.png)

.PHONY: all

all: Makefile $(ALL)

clean:
	rm -f $(ALL)

%.png:
	$(LP)/tools/theme-screenshot.sh $(HEIGHT) $(THEME)  $(addprefix presets/,$(addsuffix .conf, $(subst _, ,$(basename $(notdir $@))))) > $@

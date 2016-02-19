VERSION := 0.6.0
NAME := marathon

all: clean build

build:
	mkdir build/
	mkdir build/$(NAME)_$(VERSION)
	cp info.json info.json.temp
	sed -i -e 's/@VERSION@/$(VERSION)/' info.json
	cp -R LICENSE README.md data.lua data-updates.lua info.json prototypes migrations build/$(NAME)_$(VERSION)
	cd build && zip -r $(NAME)_$(VERSION).zip $(NAME)_$(VERSION)
	mv info.json.temp info.json

clean:
	rm -rf build/

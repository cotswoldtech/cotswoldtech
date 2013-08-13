all: build

heroku: compile build

compile:
	rm -rf node_modules/wintersmith/lib
	node_modules/coffee-script/bin/coffee \
		-o node_modules/wintersmith/lib \
		-b -c node_modules/wintersmith/src

build:
	wintersmith build --chdir src --output ../build

.PHONY all heroku compile build

in=src
out=build
bin=node_modules/wintersmith/bin

all: build

heroku: compile build

compile:
	rm -rf node_modules/wintersmith/lib
	node_modules/coffee-script/bin/coffee \
		-o node_modules/wintersmith/lib \
		-b -c node_modules/wintersmith/src

build: clean
	$(bin)/wintersmith build --chdir $(in) --output ../$(out)

clean:
	if test -d $(out); then rm -rf $(out); fi

preview:
	$(bin)/wintersmith preview --chdir $(in)

push:
	git push origin master
	git push heroku master

install:
	rm -rf node_modules/wintersmith
	npm install

update: install compile

.PHONY: all heroku compile build clean preview push install update

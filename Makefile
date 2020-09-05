test:
	rake test

build:
	- rm pkg/*.gem
	rake build

publish:
	gem push pkg/*.gem
	rm pkg/*.gem

console:
	bin/console

c: console

push:
	git push origin master

all: test build publish

.DEFAULT_GOAL := all

.PHONY: test
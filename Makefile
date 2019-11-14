SHELL := bash

install:
	npm install

hotentry/all/%:
	make -f make/html.mk dist/hotentry/all/$(@F).html
	make -f make/parse.mk dist/hotentry/all/$(@F).json

clean:
	rm -rf node_modules
	rm -rf dist


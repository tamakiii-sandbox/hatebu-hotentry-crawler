SHELL := bash

install:
	npm install

hotentry/all/%:
	make -f make/html.mk dist/hotentry/all/$(@F).html
	make -f make/json.mk dist/hotentry/all/$(@F).json

clean:
	rm -rf node_modules
	make -f make/html.mk clean
	make -f make/json.mk clean
	make -f make/markdown.mk clean


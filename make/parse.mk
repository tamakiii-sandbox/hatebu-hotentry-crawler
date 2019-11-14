SHELL := bash

DIR := $(realpath $(dir $(lastword $(MAKEFILE_LIST)))/..)

dist/hotentry/all/%:
	[[ -f $(subst .json,.html,$@) ]] || exit 1
	cat $(subst .json,.html,$@) | node $(DIR)/src/parser.js "https://b.hatena.ne.jp/hotentry/all/$(subst .json,,$@)" > $@

dist:
	mkdir $@

dist/hotentry: dist
	mkdir $@

dist/hotentry/all: dist/hotentry
	mkdir $@

clean:
	rm dist/hotentry/all/*.json

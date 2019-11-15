SHELL := bash

DIR := $(realpath $(dir $(lastword $(MAKEFILE_LIST)))/..)

dist/hotentry/all/%:
	[[ -f $(subst .json,.html,$@) ]] || exit 1
	cat $(subst .json,.html,$@) | node $(DIR)/src/parser.js "https://b.hatena.ne.jp/hotentry/all/$(subst .json,,$@)" > $@

dist/hotentry/economics/%:
	[[ -f $(subst .json,.html,$@) ]] || exit 1
	cat $(subst .json,.html,$@) | node $(DIR)/src/parser.js "https://b.hatena.ne.jp/hotentry/economics/$(subst .json,,$@)" > $@

dist/hotentry/social/%:
	[[ -f $(subst .json,.html,$@) ]] || exit 1
	cat $(subst .json,.html,$@) | node $(DIR)/src/parser.js "https://b.hatena.ne.jp/hotentry/social/$(subst .json,,$@)" > $@

dist:
	mkdir -p $@

dist/hotentry: dist
	mkdir -p $@

dist/hotentry/all: dist/hotentry
	mkdir -p $@

dist/hotentry/economics: dist/hotentry
	mkdir -p $@

dist/hotentry/social: dist/hotentry
	mkdir -p $@

clean:
	rm dist/hotentry/all/*.json
	rm dist/hotentry/economics/*.json
	rm dist/hotentry/social/*.json

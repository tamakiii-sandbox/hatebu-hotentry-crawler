SHELL := bash

TARGET := $(shell date "+%Y%m%d")

all: dist/hotentry/all/$(TARGET).html

dist/hotentry/all/%: dist/hotentry/all
	echo $(@F) | grep '^[1-9][0-9]\{3\}[0-9]\{2\}[0-9]\{2\}.html' || exit 1
	curl -s "https://b.hatena.ne.jp/hotentry/all/$(subst .html,,$(@F))" > $@

dist/hotentry/economics/%: dist/hotentry/economics
	echo $(@F) | grep '^[1-9][0-9]\{3\}[0-9]\{2\}[0-9]\{2\}.html' || exit 1
	curl -s "https://b.hatena.ne.jp/hotentry/economics/$(subst .html,,$(@F))" > $@

dist/hotentry/social/%: dist/hotentry/social
	echo $(@F) | grep '^[1-9][0-9]\{3\}[0-9]\{2\}[0-9]\{2\}.html' || exit 1
	curl -s "https://b.hatena.ne.jp/hotentry/social/$(subst .html,,$(@F))" > $@

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
	rm dist/hotentry/all/*.html
	rm dist/hotentry/economics/*.html
	rm dist/hotentry/social/*.html

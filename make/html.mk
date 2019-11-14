TARGET := $(shell date "+%Y%m%d")

all: dist/hotentry/all/$(TARGET).html

dist/hotentry/all/%: dist/hotentry/all
	echo $(@F) | grep '^[1-9][0-9]\{3\}[0-9]\{2\}[0-9]\{2\}.html' || exit 1
	curl "https://b.hatena.ne.jp/hotentry/all/$(subst .html,,$(@F))" > $@

dist:
	mkdir $@

dist/hotentry: dist
	mkdir $@

dist/hotentry/all: dist/hotentry
	mkdir $@

clean:
	rm dist/hotentry/all/*.html

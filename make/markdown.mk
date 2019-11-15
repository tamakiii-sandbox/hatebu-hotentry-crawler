SHELL := bash

DIR := $(realpath $(dir $(lastword $(MAKEFILE_LIST)))/..)

dist/hotentry/all/%:
	echo $(@F) | grep '^[1-9][0-9]\{3\}[0-9]\{2\}.md' || exit 1
	ls dist/hotentry/all/*.json | grep '^dist/hotentry/all/$(subst .mk,,$(@F))' | xargs -I@ node $(DIR)/src/2md.js '@' > $@

dist/hotentry/economics/%:
	echo $(@F) | grep '^[1-9][0-9]\{3\}[0-9]\{2\}.md' || exit 1
	ls dist/hotentry/economics/*.json | grep '^dist/hotentry/economics/$(subst .mk,,$(@F))' | xargs -I@ node $(DIR)/src/2md.js '@' > $@

dist/hotentry/social/%:
	echo $(@F) | grep '^[1-9][0-9]\{3\}[0-9]\{2\}.md' || exit 1
	ls dist/hotentry/social/*.json | grep '^dist/hotentry/social/$(subst .mk,,$(@F))' | xargs -I@ node $(DIR)/src/2md.js '@' > $@

clean:
	rm dist/hotentry/all/*.md
	rm dist/hotentry/economics/*.md
	rm dist/hotentry/social/*.md

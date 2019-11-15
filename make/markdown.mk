SHELL := bash

DIR := $(realpath $(dir $(lastword $(MAKEFILE_LIST)))/..)

dist/hotentry/all/%:
	echo $(@F) | grep '^[1-9][0-9]\{3\}[0-9]\{2\}.mk' || exit 1
	ls dist/hotentry/all/*.json | grep '^dist/hotentry/all/$(subst .mk,,$(@F))' | xargs -I@ node $(DIR)/src/2md.js '@' > $@

clean:
	rm dist/hotentry/all/*.mk

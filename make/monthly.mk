SHELL := bash

DIR := $(realpath $(dir $(lastword $(MAKEFILE_LIST)))/..)

all: \
	dist/hotentry/all/201901 \
	dist/hotentry/all/201902 \
	dist/hotentry/all/201903 \
	dist/hotentry/all/201904 \
	dist/hotentry/all/201905 \
	dist/hotentry/all/201906 \
	dist/hotentry/all/201907 \
	dist/hotentry/all/201908 \
	dist/hotentry/all/201909 \
	dist/hotentry/all/201910 \
	dist/hotentry/all/201911 \
	dist/hotentry/all/201912

dist/hotentry/all/%:
	echo $(@F) | grep '^[1-9][0-9]\{3\}[0-9]\{2\}' || exit 1
	ls dist/hotentry/all/*.json | grep '^dist/hotentry/all/$(@F)' | xargs -I@ node $(DIR)/src/2md.js '@'

__:
	# $(foreach file,$(shell ls dist/hotentry/all/*.json),$(shell cat $(file) | node $(DIR)/src/2md.js))
	# ls dist/hotentry/all/*.json | grep '^dist/hotentry/all/$(@F)' | gxargs jq -Mrc '.entries[] | \[.title.text\]\(.title.link\)'
	# ls dist/hotentry/all/*.json | grep '^dist/hotentry/all/$(@F)' | xargs cat | jq -Mrc '.entries[]' | xargs cat
	# ls dist/hotentry/all/*.json | grep '^dist/hotentry/all/$(@F)' | xargs jq -Mrc '.entries[]' | xargs cat | node $(DIR)/src/2md.js

list:
	@echo $(call MONTH_TO_DATE_PERIOD,20190101)
	@echo $(call MONTH_TO_DATE_PERIOD,20190201)
	@echo $(call MONTH_TO_DATE_PERIOD,20190301)
	@echo $(call MONTH_TO_DATE_PERIOD,20190401)
	@echo $(call MONTH_TO_DATE_PERIOD,20190501)
	@echo $(call MONTH_TO_DATE_PERIOD,20190601)
	@echo $(call MONTH_TO_DATE_PERIOD,20190701)
	@echo $(call MONTH_TO_DATE_PERIOD,20190801)
	@echo $(call MONTH_TO_DATE_PERIOD,20190901)
	@echo $(call MONTH_TO_DATE_PERIOD,20191001)
	@echo $(call MONTH_TO_DATE_PERIOD,20191101)
	@echo $(call MONTH_TO_DATE_PERIOD,20191201)

define MONTH_TO_DATE_PERIOD
$1-$(shell gdate -d "$1 +1 month -1 day" "+%Y%m%d")
endef


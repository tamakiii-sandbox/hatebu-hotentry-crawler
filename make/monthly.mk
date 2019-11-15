SHELL := bash

DIR := $(realpath $(dir $(lastword $(MAKEFILE_LIST)))/..)


@html/all: \
	@html/between/20190101-20190131 \
	@html/between/20190201-20190228 \
	@html/between/20190301-20190331 \
	@html/between/20190401-20190430 \
	@html/between/20190501-20190531 \
	@html/between/20190601-20190630 \
	@html/between/20190701-20190731 \
	@html/between/20190801-20190831 \
	@html/between/20190901-20190930 \
	@html/between/20191001-20191031
	# @html/between/20191101-20191130 \
	# @html/between/20191201-20191231

@json/all: \
	@json/between/20190101-20190131 \
	@json/between/20190201-20190228 \
	@json/between/20190301-20190331 \
	@json/between/20190401-20190430 \
	@json/between/20190501-20190531 \
	@json/between/20190601-20190630 \
	@json/between/20190701-20190731 \
	@json/between/20190801-20190831 \
	@json/between/20190901-20190930 \
	@json/between/20191001-20191031
	# @json/between/20191101-20191130 \
	# @json/between/20191201-20191231

@markdown/all: \
	@markdown/at/201901 \
	@markdown/at/201902 \
	@markdown/at/201903 \
	@markdown/at/201904 \
	@markdown/at/201905 \
	@markdown/at/201906 \
	@markdown/at/201907 \
	@markdown/at/201908 \
	@markdown/at/201909 \
	@markdown/at/201910
	# @markdown/at/201911 \
	# @markdown/at/201912

@html/between/%:
	for date in $(shell ./date_between.sh $(word 1,$(subst -, ,$(@F))) $(word 2,$(subst -, ,$(@F)))); do \
		make -f make/html.mk dist/hotentry/all/$$date.html; \
		make -f make/html.mk dist/hotentry/economics/$$date.html; \
		make -f make/html.mk dist/hotentry/social/$$date.html; \
	done

@json/between/%:
	for date in $(shell ./date_between.sh $(word 1,$(subst -, ,$(@F))) $(word 2,$(subst -, ,$(@F)))); do \
		make -f make/json.mk dist/hotentry/all/$$date.json; \
		make -f make/json.mk dist/hotentry/economics/$$date.json; \
		make -f make/json.mk dist/hotentry/social/$$date.json; \
	done

@markdown/at/%:
	make -f make/markdown.mk dist/hotentry/all/$(@F).md
	make -f make/markdown.mk dist/hotentry/economics/$(@F).md
	make -f make/markdown.mk dist/hotentry/social/$(@F).md

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

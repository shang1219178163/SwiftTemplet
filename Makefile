#需要注意的是，我们在每个target内使用制表符而不是空格是非常重要的。复制和粘贴内容时尤其如此。如果我们添加空格而不是制表符，我们将收到错误消息；

#log

NOCOLOR=\033[0m
RED=\033[0;31m
GREEN=\033[0;32m
ORANGE=\033[0;33m
BLUE=\033[0;34m
PURPLE=\033[0;35m
CYAN=\033[0;36m
LIGHTGRAY=\033[0;37m
DARKGRAY=\033[1;30m
LIGHTRED=\033[1;31m
LIGHTGREEN=\033[1;32m
YELLOW=\033[33m
LIGHTBLUE=\033[1;34m
LIGHTPURPLE=\033[1;35m
LIGHTCYAN=\033[1;36m
WHITE=\033[1;37m


#define echo_blue
#	@echo "${BLUE} $$(date +"%Y-%m-%d %H:%M:%S %z") $@: $(1)"
#endef

define echo_color
	@echo "$1 $$(date +"%Y-%m-%d %H:%M:%S %z") $@: $2"
endef

define echo_blue
	$(call echo_color, ${BLUE}, $1)
endef

define echo_yellow
	$(call echo_color, ${YELLOW}, $1)
endef

define echo_green
	$(call echo_color, ${GREEN}, $1)
endef

define echo_red
	$(call echo_color, ${RED}, $1)
endef



PROJECT_NAME	=	SwiftTemplet
SCHEME_NAME	=	SwiftTemplet


#.PHONY

.PHONY: all
all: podinstall xcodebuild

.PHONY:	help
help:	## This help dialog.
	@IFS=$$'\n' ; \
	help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//'`); \
	for help_line in $${help_lines[@]}; do \
		IFS=$$'#' ; \
		help_split=($$help_line) ; \
		help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		printf "%-30s %s\n" $$help_command $$help_info ; \
    	done


.PHONY:	podinstall
podinstall: ## podinstall
	@echo "\033[32m >>> pod install..."
	pod install

.PHONY:	xcodebuild
xcodebuild: ## xcodebuild
	@echo "\033[32m >>> xcodebuild..."
	xcodebuild -project $(PROJECT_NAME).xcodeproj -scheme $(SCHEME_NAME) -destination 'platform=iOS Simulator,name=iPhone 12 Pro,OS=15.0'


.PHONY:	path
path: ## path
	@echo "\033[32m >>> path..."
	echo `pwd`


.PHONY:	test
test:	## test
#	@echo "\033[34m >>> test..."
#	@echo "${BLUE} >>> this is a test .PHONY target"
#	@echo "--- ${username}"
#	echo -e "The first five colors of the rainbow are ${RED}red ${ORANGE}orange ${YELLOW}yellow ${GREEN}green ${NOCOLOR}and ${BLUE}blue${NOCOLOR}"
	$(call echo_blue, __ this is a test log.)
	$(call echo_green, __ this is a test log.)
	$(call echo_yellow, __ this is a test log.)
	$(call echo_red, __ this is a test log.)



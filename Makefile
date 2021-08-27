##
# Discord bot for boardsource
#
# @file
# @version 0.1

SRC = boardsourcebot.nim
SRCDIR = src
BIN = boardsourcebot
SERVICE_FILE = boardsourcebot.service
INSTALL_DIR = /opt/boardsourcebot
SERVICE_DIR = /usr/lib/systemd/system

.PHONY: default
default: release

.PHONY: debug
debug:
	nimble build '-d:ssl --cc:clang'

.PHONY: release
release:
	nimble build '-d:ssl --cc:clang -d:release'

.PHONY: clean
clean:
	rm -f ./${BIN}

.PHONY: pretty
pretty:
	nimpretty ${SRCDIR}/${SRC}

.PHONY: run
run:
	./${BIN}

.PHONY: install
install:
	mkdir -P /opt/${INSTALL_DIR}
	cp ./${BIN} /opt/${INSTALL_DIR}/${BIN}
	cp ${SERVICE_FILE} ${SERVICE_DIR}/${SERVICE_FILE}


# end

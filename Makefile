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
SERVICE_DIR = /usr/lib/systemd/system/

debug:
	nimble build '-d:ssl --cc:clang'

release:
 nimble build '-d:ssl --cc:clang -d:release'

clean:
	rm -f ./${BIN}

pretty:
	nimpretty ${SRCDIR}/${SRC}

run:
	./${BIN}

install:
	mkdir -P /opt/${INSTALL_DIR}
	cp ./${BIN} /opt/${INSTALL_DIR}/${BIN}
	cp ${SERVICE_FILE} ${SERVICE_DIR}/${SERVICE_FILE}


# end

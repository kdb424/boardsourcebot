# Boardsource bot
Boardsourcebot is designed to make the lives or the boardsource mods easier to help deal with repeat questions

## Requirements
1. Install Nim using [choosenim](https://github.com/dom96/choosenim) or [Nim's website](https://nim-lang.org/install.html)
2. Install Nimble from [nimble](https://github.com/nim-lang/nimble)

## Building
Copy `src/config.nim.example` to `src/config.nim` and add api key, as well as
adjusting the command prefix if desired.
`make release` or `make debug`

## Installing
To install, compile and then run
`sudo make install`

## Docker
This can also be built and run with docker. Simply run
`dockerrun.sh`

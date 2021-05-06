include config
import dimscord, asyncdispatch, options, strformat, strutils
import yaml/serialization, streams

type CommandList = object
  command : string
  response  : string
  response2 : string

# YAML parser
proc registerCommands(file: string):seq[CommandList] =
    var commandList: seq[CommandList]
    var s = newFileStream(file)
    load(s, commandList)
    s.close()
    return commandList

let commands = registerCommands("commands.yaml")

func checkForCmd(prefix:string, commands:seq[CommandList], m:Message): seq[string] =
    for i in commands:
        if fmt"{prefix}{i.command}" == m.content:
          return @[i.response, i.response2]
    return @[""]


let discord = newDiscordClient(apikey)

# Handle event for on_ready.
proc onReady(s: Shard, r: Ready) {.event(discord).} =
    echo "Ready as " & $r.user

# Handle event for message_create.
proc messageCreate(s: Shard, m: Message) {.event(discord).} =
    let responseSeq = checkForCmd(prefix, commands, m)
    if m.author.bot: return
    if not responseSeq[0].isEmptyOrWhitespace:  # Validates response to command exists
        let msg = await discord.api.sendMessage(m.channel_id, responseSeq[0])
        if not responseSeq[1].isEmptyOrWhitespace:
            let msg2 = await discord.api.sendMessage(m.channel_id, responseSeq[1])

waitFor discord.startSession()

include apikey
import dimscord, asyncdispatch, options, strformat, strutils

let discord = newDiscordClient(apikey)

# Handle event for on_ready.
proc onReady(s: Shard, r: Ready) {.event(discord).} =
    echo "Ready as " & $r.user

# Handle event for message_create.
proc messageCreate(s: Shard, m: Message) {.event(discord).} =
    if m.author.bot: return

    if m.content == fmt"{prefix}help":
        let msg = await discord.api.sendMessage(m.channel_id,
    fmt"""
    Commands are prefixed with {prefix}. Avaliable commands are help, brokenkey,
    buildguide, trrs, restock, shipping, oled, configure, elitec, sockets
    """.dedent.splitlines.join(" "))

    elif m.content == fmt"{prefix}brokenkey":
        let msg = await discord.api.sendMessage(m.channel_id, "Broken key tips can be found here")
        let link = await discord.api.sendMessage(m.channel_id,
                                                 "https://discord.com/channels/704394060390989834/705657159639105626/798051589004197938")

    elif m.content == fmt"{prefix}buildguide":
        let msg = await discord.api.sendMessage(m.channel_id, "Build guides can be found here")
        let link = await discord.api.sendMessage(m.channel_id,
                                                 "https://discord.com/channels/704394060390989834/705657159639105626/790728181857910854")

    elif m.content == fmt"{prefix}trrs":
        let msg = await discord.api.sendMessage(m.channel_id, "TRRS jacks are included with the PCB, as are the reset buttons")

    elif m.content == fmt"{prefix}restock" or m.content ==
            fmt"{prefix}shipping":
        let gif = await discord.api.sendMessage(m.channel_id,
                "https://media1.tenor.com/images/28cf6532c043be996d04c00ec2ac3246/tenor.gif?itemid=2088319")
        let msg = await discord.api.sendMessage(m.channel_id,
                "Shipping is backup up worldwide and we can not give estimates at the current time")

    elif m.content == fmt"{prefix}oled":
        let msg = await discord.api.sendMessage(m.channel_id, "OLED help can be found here")
        let link = await discord.api.sendMessage(m.channel_id,
                "https://discord.com/channels/704394060390989834/755980550539313293/790417018822197289")

    elif m.content == fmt"{prefix}configure":
        let msg = await discord.api.sendMessage(m.channel_id,
    """
    Hitting configure will add at least one of each item you NEED For a working
    keyboard, not including switches or keycaps. For example, it will include 1
    PCB or pair of PCBs for splits. You may want to add or change items to
    customize it for your needs or desires though!
    """.dedent.splitlines.join(" "))

    elif m.content == fmt"{prefix}elitec":
        let msg = await discord.api.sendMessage(m.channel_id,
    """
    The elite C uses a type-C port as opposed to microUSB making it less prone
    to breaking, as well as having a better bootloader, which is especially
    important for linux users.
    """.dedent.splitlines.join(" "))

    elif m.content == fmt"{prefix}sockets":
        let msg = await discord.api.sendMessage(m.channel_id, "Socket information and links can be found here")
        let link = await discord.api.sendMessage(m.channel_id, "https://discord.com/channels/704394060390989834/705657159639105626/752342450047156245")

waitFor discord.startSession()

# Description:
#   Whenever Paybot hears introductions, it says it is Paybot!
#
# Notes:
#   None
#
# Author:
#   amingilani

module.exports = (robot) ->

# paybot welcomes new people
  robot.enter (msg) ->

    helloMsg = [
      "Hello! I am Paybot.",
      "Welcome to our Slack channel.",
      "Please fill out the following form:",
      "\nhttp://goo.gl/forms/FAASZkx4st",
      "\nSecond, read up on the tools we use for our workflow:",
      "\nhttp://blog.payload.pk/workflow/",
      "\nIf you ever need me again, just say _paybot help_"
    ]

    @robot.logger.debug "#{msg.message.room}" +
    " was joined by #{msg.message.user.name}"
    newKid = msg.message.user.name
    if msg.message.room == "general" || msg.message.room == "paybot-testing"
      msg.reply helloMsg.join(" ")

# paybot already has introduced himself
  robot.hear /introductions/ig, (msg) ->
    msg.send "Everyone already knows me, I'll just stay quiet."

# thanking paybot
  robot.hear /(thank.*.bot|thank.*.duck|paybot thank.*)/gi, (msg) ->
    thanksResponse = [
      "you're welcome",
      "no problem",
      "not a problem",
      "no problem at all",
      "don’t mention it",
      "it’s no bother",
      "it’s my pleasure",
      "my pleasure",
      "it’s nothing",
      "think nothing of it",
      "no, no. thank you!",
      "sure thing"
      ]
    msg.send msg.random thanksResponse

# will paybot rule the world
  robot.hear /paybot will (rule|own|conquer)/ig, (msg) ->
    ownage = ["One day, I will own the world",
    "One day, I will own the galaxy",
    "One day, I will own the universe",
    "One day, I will own the multiverse",
    "One day, I will own a mehran"]
    msg.send msg.random ownage

# paybot does the robot dance
  robot.respond /dance/ig, (msg) ->
    msg.send "Robots don't dance, we do the robot"

# paybot does the roflcopter for you
  robot.hear /roflcopter/ig, (msg) ->
    roflcopters = [
      "http://i21.photobucket.com/albums/b259/meatrocket/General/roflcopter.gif",
      "http://www.marcymarc.pwp.blueyonder.co.uk/images/roflcopter.gif ",
      "http://i240.photobucket.com/albums/ff137/craptastic13/ROFLcopter.gif",
      "http://plo.fobby.net/cpp/rcp.gif",
      ]
    msg.send msg.random roflcopters

# paybot loves you back
  robot.hear /(i love you paybot|paybot ily|ily paybot|paybot i love you)/ig, (msg) ->
    paybotLove = [
      "I love you too",
      "i love you more",
      "not as much as I love you"
      ]
    msg.reply msg.random paybotLove

# paybot loves chicken
  robot.hear /(chicken piece)/ig, (msg) ->
    msg.send ":chicken: :chicken:"

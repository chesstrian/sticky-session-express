sticky = require 'sticky-session'

{server, port} = require './app'

unless sticky.listen server, port
  server.once 'listening', () ->
    console.log 'Master started'
else
  console.log 'Worker'

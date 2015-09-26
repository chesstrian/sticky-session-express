express = require 'express'
http = require 'http'
redis = require 'socket.io-redis'
socket = require 'socket.io'

path = require 'path'

app = express()
exports.server = server = http.createServer app
io = socket server

exports.port = port = process.env.PORT or 3000

app.get '/', (req, res) ->
  res.sendFile path.join __dirname, './index.html'

io.adapter redis()

io.on 'connection', (socket) ->
  console.log  process.pid  + ':connected'
  socket.broadcast.send 'message'

run = ->
  server.listen port, ->
    console.log "Express server listening on port #{port}"

run() if require.main is module

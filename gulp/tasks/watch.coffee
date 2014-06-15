gulp     = require 'gulp'
settings = require './settings'
sync     = require "browser-sync"
shell    = require 'gulp-shell'
process  = require 'child_process'
Notifier = require 'node-notifier'

gulp.task 'watch', ['build'], () ->
  global.isWatching = true
  server            = null

  startServer = (signal) ->
    server.kill(signal) if (signal and server)

    server = process.spawn("#{settings.server.dest}/#{settings.server.binary}")
    server.stdout.on "data", (data) -> console.log(data.toString())
    server.stderr.on "data", (data) -> console.log(data.toString())
    server.on "close", (code) ->
      new Notifier().notify { title: "Noted Server Restarting", message: "With Code #{code}" }

  gulp.watch settings.scripts.src, ['browserify']
  gulp.watch settings.stylesheets.src, ['less']
  gulp.watch settings.html.src, ['copy']
  gulp.watch settings.server.src, ['go']
  gulp.watch "#{settings.server.dest}/#{settings.server.binary}", () -> startServer("SIGINT")

  startServer()

  sync.init "#{settings.client.dest}/**", {
    server: { baseDir: settings.client.dest }
  }
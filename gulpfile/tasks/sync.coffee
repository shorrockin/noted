sync     = require "browser-sync"
gulp     = require "gulp"
settings = require './settings'

gulp.task "sync", ["build", "watch"], () ->
  sync.init "#{settings.client.dest}/**", {
    server: { baseDir: settings.client.dest }
  }
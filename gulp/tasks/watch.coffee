gulp     = require 'gulp'
settings = require './settings'

gulp.task 'watch', () ->
  global.isWatching = true

  gulp.watch settings.scripts.src, ['browserify']
  gulp.watch settings.stylesheets.src, ['less']
  gulp.watch settings.html.src, ['copy']
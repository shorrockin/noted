gulp     = require 'gulp'
settings = require './settings'

gulp.task 'watch', () ->
  gulp.watch settings.scripts.src, ['browserify']
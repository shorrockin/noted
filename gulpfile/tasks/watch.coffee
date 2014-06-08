gulp  = require 'gulp'
paths = require './paths'

gulp.task 'watch', () ->
  gulp.watch paths.scripts.src, ['scripts']
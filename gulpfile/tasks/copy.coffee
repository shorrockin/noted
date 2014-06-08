gulp     = require 'gulp'
settings = require './settings'
changed  = require 'gulp-changed'

gulp.task 'copy', () ->
  gulp
    .src(settings.html.src)
    .pipe(changed(settings.html.dest))
    .pipe(gulp.dest(settings.html.dest))
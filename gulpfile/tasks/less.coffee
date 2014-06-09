gulp     = require "gulp"
less     = require "gulp-less"
changed  = require "gulp-changed"
settings = require "./settings"
notify   = require '../utils/notify'

gulp.task 'less', () ->
  gulp
    .src(settings.stylesheets.src)
    .pipe(notify("less"))
    .pipe(changed(settings.stylesheets.dest))
    .pipe(less())
    .pipe(gulp.dest(settings.stylesheets.dest))

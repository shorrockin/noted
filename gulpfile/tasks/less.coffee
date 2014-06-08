gulp     = require "gulp"
less     = require "gulp-less"
changed  = require "gulp-changed"
settings = require "./settings"

gulp.task 'less', () ->
  gulp
    .src(settings.stylesheets.src)
    .pipe(changed(settings.stylesheets.dest))
    .pipe(less())
    .pipe(gulp.dest(settings.stylesheets.dest))
gulp     = require "gulp"
less     = require "gulp-less"
settings = require "./settings"

gulp.task 'less', () ->
  gulp
    .src(settings.stylesheets.src)
    .pipe(less())
    .pipe(gulp.dest(settings.stylesheets.dest))
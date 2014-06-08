gulp   = require 'gulp'
coffee = require 'gulp-coffee'
paths  = require './paths'

console.log "src is #{paths.scripts.src}"
gulp.task 'scripts', () ->
  gulp.src(paths.scripts.src)
    .pipe(coffee())
    .pipe(gulp.dest(paths.scripts.dest))

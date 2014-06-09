settings   = require './settings'
gulp       = require 'gulp'
browserify = require 'browserify'
watchify   = require 'watchify'
source     = require 'vinyl-source-stream'
notify     = require '../utils/notify'

gulp.task 'browserify', () ->
  options =
    entries: ["./#{settings.scripts.root}"]
    extensions: ['.coffee']

  bundler = if global.isWatching then watchify(options) else browserify(options)

  bundle = () ->
    bundler
      .bundle(debug: settings.scripts.debug)
      .pipe(notify("browserify"))
      .pipe(source(settings.scripts.app.replace(".coffee", ".js")))
      .pipe(gulp.dest(settings.scripts.dest))


  bundler.on("updated", bundle) if global.isWatching

  bundle()
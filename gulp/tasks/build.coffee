gulp = require 'gulp'

gulp.task 'build', ['browserify', 'less', 'go', 'copy']
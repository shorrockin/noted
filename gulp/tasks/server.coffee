gulp     = require 'gulp'
settings = require './settings'
sync     = require "browser-sync"

gulp.task 'server', ['go'], () ->
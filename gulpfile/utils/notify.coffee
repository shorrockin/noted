notify  = require "gulp-notify"
utils   = require "gulp-util"
plumber = require "gulp-plumber"

module.exports = (name) ->
  magenta = utils.colors.magenta
  cyan    = utils.colors.cyan
  red     = utils.colors.red
  log     = utils.log

  plumber (error) ->
    log red("#{name} error"), "in", magenta("'#{error.fileName}'"), "line", cyan("#{error.lineNumber}")
    log "\tmessage:", cyan("'#{error.message}'")
    notify {
      title: "#{name} error"
      message: error.message
    }

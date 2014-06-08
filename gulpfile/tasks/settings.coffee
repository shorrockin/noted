src  = "src"
dest = "build"


client =
  src: "#{src}/client"
  dest: "#{dest}/client"
  app: "app.coffee"


module.exports = {
  scripts:
    debug: true
    app: client.app
    root: "#{client.src}/coffee/#{client.app}"
    src: "#{client.src}/coffee/**/*.coffee"
    dest: "#{client.dest}/js"

  stylesheets:
    src: "#{client.src}/less/**/*.less"
    dest: "#{client.dest}/stylesheets"
}
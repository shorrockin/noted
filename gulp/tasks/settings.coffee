src  = "src"
dest = "build"

client =
  src: "#{src}/client"
  dest: "#{dest}/client"
  app: "app.coffee"


module.exports = {
  client:
    dest: client.dest

  server:
    root: "#{src}/server"
    binary: "server"
    dest: dest
    src: "#{src}/server/**/*.go"
    main: "#{src}/server/main"
    gohome: "build/go"
    pkg: "github.com/shorrockin/noted"

  scripts:
    debug: true
    app: client.app
    root: "#{client.src}/coffee/#{client.app}"
    src: "#{client.src}/coffee/**/*.coffee"
    dest: "#{client.dest}/js"

  html:
    src: "#{client.src}/html/**/*.html"
    dest: client.dest

  stylesheets:
    src: "#{client.src}/less/**/*.less"
    dest: "#{client.dest}/stylesheets"
}
src  = "src"
dest = "build"

client =
  src: "/build/src"
  dest: "/build/out"
  app: "app.coffee"


module.exports = {
  client:
    dest: client.dest

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
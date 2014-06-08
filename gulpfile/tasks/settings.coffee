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
}
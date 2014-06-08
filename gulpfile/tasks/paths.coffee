src  = "src"
dest = "build"

client =
  src: "#{src}/client"
  dest: "#{dest}/client"

module.exports = {
  scripts:
    src: "#{client.src}/coffee/**/*.coffee"
    dest: "#{client.dest}/js"
}
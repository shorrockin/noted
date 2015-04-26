require("coffee-script/register")

var gulp   = require('gulp');
var fs     = require('fs');
var path   = require('path');
var tasks  = fs.readdirSync('./build/tasks/').filter(function(name) { return /(\.(js|coffee)$)/i.test(path.extname(name))} );

tasks.forEach(function(task) {
	require('./build/tasks/' + task);
});

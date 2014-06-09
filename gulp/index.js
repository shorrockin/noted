require("coffee-script/register")

var gulp   = require('gulp');
var fs     = require('fs');
var filter = require('./utils/scriptFilter.coffee');
var tasks  = fs.readdirSync('./gulp/tasks/').filter(filter);

tasks.forEach(function(task) {
	require('./tasks/' + task);
});

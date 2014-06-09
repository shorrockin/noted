noted
=====

simple task list type of app, written in go and react just to get a feeling for the languages and libraries. toying around mostly,
this app allowed me to toy around with the following:

* react (http://facebook.github.io/react/)
* golang (http://golang.org)
* gulp (http://gulpjs.com)
* browserify (http://browserify.org)
* browser-sync (http://browsersync.io/)

requirements
=====
This app uses gulp to build all the depenedencies which is a node based build system,
so nodejs is required. Once installed you can just run:

> npm install

building
=====
npm install will install gulp, which by default, throws the gulp binary in the
node_modules/.bin directory. To simplify working with node projects, often you put
./node_modules/.bin in your PATH variable, this allows direct access to the gulp
command:

> gulp

Which builds and then watches the file system. Also, you can run:

> gulp sync

To open up a browser that'll refresh what's needed whenever anything on the file system
changes. Handy!

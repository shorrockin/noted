noted
=====

simple task list type of app, written in go and react just to get a feeling for the languages 
and libraries. toying around mostly, this app allowed me to toy around with the following:

* react (http://facebook.github.io/react/)
* golang (http://golang.org)
* gulp (http://gulpjs.com)
* browserify (http://browserify.org)
* browser-sync (http://browsersync.io/)


design
=====
This simple demo app uses react on the client utilizing the flux (http://facebook.github.io/react/docs/flux-overview.html) pattern to ensure one way communication with a simple set of models built around this. The client
is quite simple, it's a list which gets initialized from the server at boot, and then POST's to the
server to create new notes. 

The server is a simple golang based sturcture using a mock in-memory data store to manage all the 
notes with HTTP routing provided by gorilla mux (http://www.gorillatoolkit.org/pkg/mux).

Again, this app really isn't meant to do much other than let me toy with a few different technologies
however if you have questions please feel free to contact me at chris.shorrock@gmail.com

requirements
=====
This app uses gulp to build all the depenedencies which is a node based build system,
so nodejs is required. Once installed you can just run:

> npm install

Additionall go (http://golang.org) is also required to build the server. See the golang
docs to ensure that this is setup properly.

building
=====
npm install will install gulp, which by default, throws the gulp binary in the
node_modules/.bin directory. To simplify working with node projects, often you put
./node_modules/.bin in your PATH variable, this allows direct access to the gulp
command:

> gulp

This will build everything and open up a browser that'll refresh what's needed whenever 
anything on the file system changes. Handy!

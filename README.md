noted
=====

simple task list type of app, written in go and react just to get a feeling for the languages and libraries. toying around.


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

Which builds and then watches the file system.

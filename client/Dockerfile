FROM google/nodejs

RUN apt-get update -qq && apt-get install -y build-essential
RUN apt-get install -y ruby
RUN gem install sass

RUN mkdir /build

RUN npm install gulp -g

WORKDIR /build
ADD build/package.json /build/package.json
RUN npm install

ADD src /build/src
ADD build/gulpfile.js /build/gulpfile.js
ADD build/tasks build/tasks

RUN mkdir /build/out
ADD src/html /build/out

RUN gulp
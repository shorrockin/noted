FROM google/nodejs

# update the operating system
RUN apt-get update -qq && apt-get install -y build-essential
RUN apt-get install -y ruby
RUN gem install sass

RUN apt-get update -qq && apt-get -y install nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

ADD build/nginx.conf /etc/nginx/sites-available/default

RUN mkdir /build

RUN npm install gulp -g

# create and build all the codes
WORKDIR /build
ADD build/package.json /build/package.json
RUN npm install

ADD src /build/src
ADD build/gulpfile.js /build/gulpfile.js
ADD build/tasks build/tasks

RUN mkdir /build/out
ADD src/html /build/out

RUN gulp

# Define default command.
CMD ["nginx"]

# Expose ports.
EXPOSE 80

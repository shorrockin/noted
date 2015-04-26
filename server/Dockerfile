FROM google/golang

RUN go get github.com/codegangsta/gin
RUN go get github.com/gorilla/mux

RUN mkdir -p /gopath/src/github.com/shorrockin/noted
ADD ./src /gopath/src/github.com/shorrockin/noted
RUN go get github.com/shorrockin/noted

EXPOSE 3000
CMD ["/gopath/bin/noted"]

package main

import (
	"github.com/gorilla/mux"
	"github.com/shorrockin/noted/log"
	"net/http"
)

type Route struct {
	method  string
	path    string
	handler func(http.ResponseWriter, *http.Request)
}

var routes []Route

func Map(method string, path string, handler func(http.ResponseWriter, *http.Request)) {
	routes = append(routes, Route{method, path, handler})
}

func main() {
	log.Debug("noted server booting up")

	router := mux.NewRouter()

	for _, value := range routes {
		log.Debug("binding %v %v to %v", value.method, value.path, value.handler)
		router.HandleFunc(value.path, value.handler).Methods(value.method)
	}

	log.Debug("noted server listening on port 3000")
	http.ListenAndServe(":3000", router)
}

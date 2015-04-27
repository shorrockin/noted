package main

import (
	"net/http"

	"github.com/gorilla/mux"
	"github.com/shorrockin/noted/log"
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

func initRouter() http.Handler {
	router := mux.NewRouter()

	for _, value := range routes {
		log.Debug("binding %v %v", value.method, value.path)
		router.HandleFunc(value.path, value.handler).Methods(value.method)
	}

	return router
}

func main() {
	log.Debug("noted server booting up, binding to port 3000!")
	http.ListenAndServe(":3000", initRouter())
}

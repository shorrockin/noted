package main

import (
	"github.com/shorrockin/noted/log"
	"net/http"
	"testing"
)

func TestMap(t *testing.T) {
	initial := len(routes)

	Map("GET", "/testing", func(writer http.ResponseWriter, request *http.Request) {
		log.Debug("called when /testing is accessed")
	})

	if len(routes) != initial+1 {
		t.Errorf("expected to have %v routes, but had %v", initial+1, len(routes))
	}

	if routes[initial].method != "GET" {
		t.Errorf("expected route to have method GET but had %v", routes[initial].method)
	}

	if routes[initial].path != "/testing" {
		t.Errorf("expected route to have method '/testing' but had %v", routes[initial].method)
	}
}

func TestInitRouter(t *testing.T) {
	initRouter() // as long as this doesn't give an exception we're good
}

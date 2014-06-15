package main

import (
	"github.com/shorrockin/noted/log"
	"net/http"
)

func init() {
	Map("GET", "/notes", func(writer http.ResponseWriter, request *http.Request) {
		log.Debug("retrieves all the notes")
	})
}

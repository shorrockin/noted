package main

import (
	"fmt"
	"github.com/gorilla/mux"
	"github.com/shorrockin/noted/log"
	"github.com/shorrockin/noted/store"
	"net/http"
)

func init() {
	Map("GET", "/notes", Notes)
	Map("POST", "/notes", Notes)
	Map("DELETE", "/notes/{id:[0-9]+}", RemoveNote)

	store.CreateNote("This note was seeded on the server, it should always be first")
}

func variables(request *http.Request) map[string]string {
	return mux.Vars(request)
}

func Notes(writer http.ResponseWriter, request *http.Request) {
	log.Debug("handling request to retrieve all notes")
	writer.Header().Set("Content-Type", "application/json")
	fmt.Fprint(writer, store.Notes)
}

func CreateNote(writer http.ResponseWriter, request *http.Request) {
	log.Debug("handling request to create a new note")
}

func RemoveNote(writer http.ResponseWriter, request *http.Request) {
	vars := variables(request)
	id := vars["id"]

	log.Debug("handling request to delete note %v", id)
}

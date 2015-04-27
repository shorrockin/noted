package main

import (
	"fmt"
	"io/ioutil"
	"net/http"

	"github.com/gorilla/mux"
	"github.com/shorrockin/noted/log"
	"github.com/shorrockin/noted/store"
)

func init() {
	Map("GET", "/notes", ContentType("application/json", CrossOrigin(Notes)))
	Map("POST", "/notes", ContentType("application/json", CrossOrigin(CreateNote)))
	Map("OPTIONS", "/notes", CrossOrigin(Ignore))
	Map("DELETE", "/notes/{id:[0-9]+}", CrossOrigin(RemoveNote))

	store.CreateNote("This note was seeded on the server, it should always be first")
}

func variables(request *http.Request) map[string]string {
	return mux.Vars(request)
}

func CrossOrigin(next func(http.ResponseWriter, *http.Request)) func(http.ResponseWriter, *http.Request) {
	return func(writer http.ResponseWriter, request *http.Request) {
		log.Debug("setting cross-origin header for request")
		writer.Header().Set("Access-Control-Allow-Origin", "*")
		next(writer, request)
	}
}

func ContentType(contentType string, next func(http.ResponseWriter, *http.Request)) func(http.ResponseWriter, *http.Request) {
	return func(writer http.ResponseWriter, request *http.Request) {
		log.Debug("setting content type for request")
		writer.Header().Set("Content-Type", contentType)
		next(writer, request)
	}
}

func Notes(writer http.ResponseWriter, request *http.Request) {
	log.Debug("handling request to retrieve all notes")
	fmt.Fprint(writer, store.Notes.String())
}

func CreateNote(writer http.ResponseWriter, request *http.Request) {
	log.Debug("handling request to create a new note")
	bs, err := ioutil.ReadAll(request.Body)

	if err != nil {
		// TODO handle err better
		fmt.Fprint(writer, err.Error)
	} else {
		note := store.CreateNote(string(bs))
		log.Debug("created %v", note.String())
		fmt.Fprint(writer, note.String())
	}
}

func RemoveNote(writer http.ResponseWriter, request *http.Request) {
	vars := variables(request)
	id := vars["id"]

	log.Debug("handling request to delete note %v", id)
}

func Ignore(writer http.ResponseWriter, request *http.Request) {
	log.Debug("ignoring OPTION request")
}

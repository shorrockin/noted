package store

import (
	"encoding/json"
	"github.com/shorrockin/noted/log"
)

type Note struct {
	Id      uint64 `json:"id"`
	Content string `json:"content"`
}

func (note Note) String() string {
	bytes, error := json.Marshal(note)
	if error != nil {
		log.Warn("encountered error marshelling note: %v", error)
		return ""
	}
	return string(bytes)
}

func (note *Note) FromJson(bytes []byte) (err error) {
	err = json.Unmarshal(bytes, note)
	return
}

// Note is a collection of all the notes we're currently managing.
var Notes []Note

// CreateNote creates a note with the specified string as a note
func CreateNote(content string) (note Note) {
	note = Note{NextId(), content}
	Notes = append(Notes, note)
	return
}

// RemoveNote removes the specified note from the system using the
// id to find it.
func RemoveNote(id uint64) {
	for index, note := range Notes {
		if note.Id == id {
			Notes = append(Notes[:index], Notes[index+1:]...)
			return
		}
	}
}

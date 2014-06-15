package store

type Note struct {
	id      uint64 `json:"id"`
	content string `json:"content"`
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
		if note.id == id {
			Notes = append(Notes[:index], Notes[index+1:]...)
			return
		}
	}
}

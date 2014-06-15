package store

import (
	"testing"
)

func TestCreateNote(t *testing.T) {
	size := uint64(len(Notes))

	note := CreateNote("this is a test note")
	if note.id != size+1 {
		t.Errorf("expected new note id to be %v but was %v", size+1, note.id)
	}

	if uint64(len(Notes)) != size+1 {
		t.Errorf("expected new note to be added to collection, wasn't size is now %v", len(Notes))
	}
}

func TestRemoveNote(t *testing.T) {
	size := uint64(len(Notes))

	first := CreateNote("this is the first note")
	second := CreateNote("this is the second note")
	third := CreateNote("this is the third note")

	RemoveNote(second.id)

	if sizeNow := uint64(len(Notes)); sizeNow != size+2 {
		t.Errorf("expected new note to be added to collection, wasn't size is now %v", sizeNow)
	}

	if last := Notes[len(Notes)-1]; last.id != third.id {
		t.Errorf("expected the last note to be 'third' was %v", last.content)
	}

	if secondLast := Notes[len(Notes)-2]; secondLast.id != first.id {
		t.Errorf("expected the second to last note to be 'first' was %v", secondLast.content)
	}
}

package store

import (
	"testing"
)

func TestJsonRendering(t *testing.T) {
	note := &Note{1, "this is my note, isn't it great!?"}
	stringd := note.String()

	var unmarshelled Note

	err := unmarshelled.FromJson([]byte(stringd))
	if err != nil {
		t.Errorf("could not unmarhel json structure: %v", err)
	}

	if unmarshelled.Id != note.Id {
		t.Errorf("unmarshelled id did not match %v != %v", unmarshelled.Id, note.Id)
	}

	if unmarshelled.Content != note.Content {
		t.Errorf("unmarshelled content did not match %v != %v", unmarshelled.Content, note.Content)
	}

	noIdContent := "{\"content\": \"hello my friend\"}"
	noIdNote := &Note{}
	err = noIdNote.FromJson([]byte(noIdContent))

	if err != nil {
		t.Errorf("could not unmarshel json structure with just content:", err)
	}

	if noIdNote.Content != "hello my friend" {
		t.Errorf("expected 'hello my friend' not, got %v, from %v", noIdContent, noIdNote)
	}
}

func TestCreateNote(t *testing.T) {
	size := uint64(len(Notes))

	note := CreateNote("this is a test note")
	if note.Id != size+1 {
		t.Errorf("expected new note.Id to be %v but was %v", size+1, note.Id)
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

	RemoveNote(second.Id)

	if sizeNow := uint64(len(Notes)); sizeNow != size+2 {
		t.Errorf("expected new note to be added to collection, wasn't size is now %v", sizeNow)
	}

	if last := Notes[len(Notes)-1]; last.Id != third.Id {
		t.Errorf("expected the last note to be 'third' was %v", last.Content)
	}

	if secondLast := Notes[len(Notes)-2]; secondLast.Id != first.Id {
		t.Errorf("expected the second to last note to be 'first' was %v", secondLast.Content)
	}
}

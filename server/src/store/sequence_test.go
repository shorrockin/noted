package store

import (
	"testing"
)

func TestNextId(t *testing.T) {
	initial := idSequence
	next := NextId()

	if initial+1 != next {
		t.Errorf("expected NextId to return %v, but returned %v", initial+1, next)
	}
}

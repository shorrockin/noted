package store

import (
	"sync/atomic"
)

var idSequence uint64 = 0

func NextId() uint64 {
	return atomic.AddUint64(&idSequence, 1)
}

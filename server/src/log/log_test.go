package log

import "testing"

func TestLogging(t *testing.T) {
	Debug("this is a debug message")
	Info("this is a info message")
	Warn("this is a warning message")
	Error("this is a panic message")
	Temp("this is a temporary message")
}

func TestPanic(t *testing.T) {
	defer func() {
		if res := recover(); res != nil {
			Info("recovered: %v", res)
		} else {
			t.Error("Recover was never called")
		}
	}()

	Panic("This is a panic message, panic should panic, and shut things down unless rescued")
	t.Error("This should never get here")
}

func TestSetMinLevel(t *testing.T) {
	defer func() { MinLevel = DebugLevel }()

	Debug("current min level is %v, setting to %v", MinLevel, FatalLevel)
	MinLevel = FatalLevel
	Panic("this should not panic, which is bad, but the min level should reset it")
	Debug("hurray, we didn't panic, however this won't get printed because the level wasn't reset by this point")
}

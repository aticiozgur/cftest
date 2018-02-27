package main

import (
	"testing"
)

func TestSum(t *testing.T) {
	result := Sum(2, 2)
	if result != 4 {
		t.Fatalf("Test failed...")
	}
}

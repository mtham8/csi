package testexample

import (
	"github.com/stretchr/testify/require"
	"testing"
)

func Test_AddInt(t *testing.T) {
	t.Run("successfully adds integers", func(t *testing.T) {
		// GIVEN
		int1 := 1
		int2 := 2
		expected := 3
		// WHEN
		sum := AddInt(int1, int2)
		// THEN
		require.Equal(t, expected, sum)
	})
}

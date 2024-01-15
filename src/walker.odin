package walker

import "core:math"
import "core:math/rand"
import rl "vendor:raylib"

STEPS :: 200

Walker :: struct {
	pos:    rl.Vector2,
	points: [dynamic]rl.Vector2,
}
walker_init :: proc(pos: rl.Vector2) -> Walker {
	return {pos = pos}
}

@(private = "file")
walker_get_direction :: proc() -> rl.Vector2 {
	switch math.floor(rand.float32_range(0, 4)) {
	case 0:
		return {0, 1} * 10
	case 1:
		return {0, -1} * 10
	case 2:
		return {1, 0} * 10
	case 3:
		return {-1, 0} * 10
	}
	return {0, 0}
}

walker_walk :: proc(walker: ^Walker) {
	for i in 0 ..< STEPS {
		walker.pos += walker_get_direction()
		append(&walker.points, walker.pos)
	}
}

walker_draw :: proc(walker: Walker, color: rl.Color) {
	for point in walker.points {
		rl.DrawCircleV(point, 2, color)
	}
}

package walker

import "core:fmt"
import rl "vendor:raylib"

main :: proc() {
	rl.InitWindow(800, 600, "Random-Walker")
	defer rl.CloseWindow()
	rl.SetTargetFPS(60)

	walker := walker_init({f32(rl.GetScreenWidth() / 2), f32(rl.GetScreenHeight() / 2)})
	walker_walk(&walker)

	walker2 := walker_init({f32(rl.GetScreenWidth() / 2), f32(rl.GetScreenHeight() / 2)})
	walker_walk(&walker2)

	for !rl.WindowShouldClose() {
		rl.BeginDrawing()
		defer rl.EndDrawing()
		rl.ClearBackground(rl.BLACK)
		walker_draw(walker, rl.WHITE)
		walker_draw(walker2, rl.RED)
	}
}

extends State

class_name Idle_state

func enter():
	character.animated_sprite_3d.play(idle_anim)


func process_physics(delta: float) -> State:
	super(delta)
	if not character.is_on_floor():
		character.velocity.y+=character.get_gravity().y*delta
	character.move_and_slide()
	return null

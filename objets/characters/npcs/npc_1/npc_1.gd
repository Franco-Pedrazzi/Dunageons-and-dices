extends Character

func _physics_process(delta: float) -> void:
	body_rotated+=0.1
	Character_physics_process(delta)

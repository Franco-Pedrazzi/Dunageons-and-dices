class_name State
extends Node3D

@onready var character=$"../../."
var current_direction_x
var idle_anim="Idle_"
func enter():
	current_direction_x=character.current_direction_x
	idle_anim="Idle_"+current_direction_x
func exit():
	pass

func process_physics(delta: float) -> State:
	if current_direction_x!=character.current_direction_x:
		current_direction_x=character.current_direction_x
		idle_anim="Idle_"+character.current_direction_x
		enter()
		
	return null
func process_frame(delta: float) -> State:
	return null
func process_input(event: InputEvent) -> State:
	return null

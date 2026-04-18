extends CharacterBody3D
class_name Character

@onready var stateMachine:StateMachine=$StateMachine
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite_3d: AnimatedSprite3D = $AnimatedSprite3D
@onready var player=get_tree().get_first_node_in_group("Player")

var directions_x = [
	"rigth",
	"diagonal_rigth_back",
	"back",
	"diagonal_left_back",
	"left",
	"diagonal_left_front",
	"front",
	"diagonal_rigth_front"
]
var current_direction_x
func _ready() -> void:

	stateMachine.StateMachine_ready()
	
func _process(delta: float) -> void:stateMachine.process_frame(delta)

func _physics_process(delta: float) -> void:
	animated_sprite_3d.look_at(player.global_position, Vector3.UP)
	
	var angle = animated_sprite_3d.rotation.y
	
	if angle < 0:
		angle += TAU
	
	var segment = int(round(angle / (TAU / 8))+2) % 8

	current_direction_x=directions_x[segment]
	
	stateMachine.process_physics(delta)

func _input(event: InputEvent) -> void:stateMachine.process_input(event)
	

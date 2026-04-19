extends CharacterBody3D
var speed=10;
var acelerate=1;

var Mouse_sens:float=0.5

@onready var head=$Head

func _ready() -> void:
	Input.mouse_mode=Input.MOUSE_MODE_CAPTURED
func  _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotation_degrees.y-=event.relative.x * Mouse_sens
		head.rotation_degrees.x-=event.relative.y * Mouse_sens
		if head.rotation_degrees.x<-90:
			head.rotation_degrees.x=-90
		if head.rotation_degrees.x>90:
			head.rotation_degrees.x=90
func _physics_process(delta: float) -> void:
	var input_direction:Vector2=Input.get_vector("left","right","back","front")
	var move_direction:Vector3=(transform.basis * Vector3(input_direction.x,0,-1*input_direction.y)).normalized()
	
	if not is_on_floor():
		velocity.y=move_toward(velocity.y,-speed,acelerate)
	
	if move_direction.z:
		velocity.z=move_toward(velocity.z,speed*move_direction.z,acelerate)
	else:
		velocity.z=move_toward(velocity.z,0,acelerate)
		
	if move_direction.x:
		velocity.x=move_toward(velocity.x,speed*move_direction.x,acelerate)
	else:
		velocity.x=move_toward(velocity.x,0,acelerate)
		
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y=speed

	move_and_slide()

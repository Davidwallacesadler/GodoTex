extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	# Get the input direction and handle the movement/deceleration.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	move_and_slide()


func _input(event):
	_aim(event)
	_handle_mouse_escape(event)
	_handle_ivestigation(event)


func _aim(event: InputEvent):
	var mouse_motion = event as InputEventMouseMotion
	if mouse_motion:
		# Rotate around y using mouse x-position
		rotation_degrees.y -= mouse_motion.relative.x
		# Rotate around x using mouse y-position
		var cameraTilt = $Camera.rotation_degrees.x
		cameraTilt -= mouse_motion.relative.y
		$Camera.rotation_degrees.x = clamp(cameraTilt, -90.0, 90.0)


func _handle_mouse_escape(event: InputEvent):
	if event.is_action_pressed("ui_accept"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _handle_ivestigation(event: InputEvent):
	if event.is_action_pressed("ui_select"):
		var focused_object = $Camera/InteractionRayCast.get_collider()
		if focused_object as WorldItem:
			GameEvents.item_investigated.emit(focused_object.quip)

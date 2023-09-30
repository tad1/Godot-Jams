extends RigidBody3D

@export
var max_speed: float = 5
@export
var max_friction: float = 0.5
@export
var interpolation_time: float = 0.5
@export
var jump_force: float = 3
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var force = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if(force.length() > 0):
		force = force.lerp(force.normalized() * max_speed, delta * interpolation_time)
		self.apply_torque(Vector3(force.x, 0, force.y) * max_speed)
	else:
		self.apply_torque(-angular_velocity.lerp(Vector3.ZERO, delta * interpolation_time * 2))
	if(Input.is_action_just_pressed("jump")):
		apply_impulse(Vector3.UP * jump_force)
	var friction = self.angular_velocity.normalized() * min(self.angular_velocity.length(), max_friction)
	self.apply_torque(-friction)

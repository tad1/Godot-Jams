extends Camera3D

@export
var player: Node3D
var distance: Vector3

# Called when the node enters the scene tree for the first time.
func _ready():
	distance = self.position - player.position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position = player.position + distance

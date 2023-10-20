extends Camera3D

const SPEED = 10
# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction_x = Input.get_axis("left", "right")
	var direction_y = Input.get_axis("back", "forward")
	if direction_x:
		transform.position.x += direction * SPEED
	if direction_y:
		transform.position.y += direction * SPEED

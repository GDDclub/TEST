extends CharacterBody2D

var SPEED = 50
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player
var chase = false 

func _ready():
	get_node("AnimatedSprite2D").play("idle")

func _physics_process(delta):
	velocity.y += gravity * delta
	if chase == true:
		if get_node("AnimatedSprite2D").animation != "death":
			get_node("AnimatedSprite2D").play("jump")
		player = get_node("../../Player/Player")
		var direction = (player.position - self.position).normalized()
		if direction.x > 0:
			get_node("AnimatedSprite2D").flip_h = true
		else:
			get_node("AnimatedSprite2D").flip_h = false
		velocity.x = direction.x * SPEED
	else:
		if get_node("AnimatedSprite2D").animation != "death":
			get_node("AnimatedSprite2D").play("idle")
		velocity.x = 0
	move_and_slide()

func _on_player_detection_body_entered(body):
	if body.name == "Player":
		chase = true 


func _on_player_detection_body_exited(body):
	if body.name == "Player":
		chase = false  # Replace with function body.


func _on_player_death_body_entered(body):
	if body.name == "Player":
		print("frog killed")
		death()

func _on_player_damage_body_entered(body):
	if body.name == "Player":
		print("get good at the game")
		body.HEALTH -= 20
		death()


func death():
	chase = false
	get_node("AnimatedSprite2D").play("death")
	await get_node("AnimatedSprite2D").animation_finished
	self.queue_free()

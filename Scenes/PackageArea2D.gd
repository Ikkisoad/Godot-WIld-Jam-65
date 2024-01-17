extends Area2D

const xSpeed = 0.5
const PLAYER_GROUP = "player"

func _physics_process(delta):
	position.x -= xSpeed

func _on_body_entered(body):
	if body.is_in_group(PLAYER_GROUP):
		body.collectPackage()
		queue_free()

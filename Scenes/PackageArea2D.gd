extends Area2D

const PLAYER_GROUP = "player"

func _physics_process(delta):
	position.x -= Autoload.xSpeed

func _on_body_entered(body):
	if body.is_in_group(PLAYER_GROUP) && Autoload.packages < 5:
		body.collectPackage()
		queue_free()

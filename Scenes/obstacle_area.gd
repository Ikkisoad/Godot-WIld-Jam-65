extends Area2D

var scrollingSpeed : float = 120.0
const PLAYER_GROUP = "player"

func _process(delta: float) -> void:
	ScrollTheObject(delta)

func ScrollTheObject(deltaTime: float):
	position.x -= scrollingSpeed * deltaTime

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group(PLAYER_GROUP):
		body.Die()

func _on_screen_exited() -> void:
	queue_free()

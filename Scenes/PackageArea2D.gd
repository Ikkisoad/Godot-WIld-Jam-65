extends Area2D

const xSpeed = 0.5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= xSpeed


func _on_body_entered(body):
	body.collectPackage()
	queue_free()

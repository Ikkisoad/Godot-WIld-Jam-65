extends Area2D

const xSpeed = 10.5
const PACKAGE_GP_NAME = "Package"
var hitScore : int = 20 

func _process(delta):
	position.x -= xSpeed

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group(PACKAGE_GP_NAME):
		Autoload.countScore(hitScore)
		body.DestroyPackage()


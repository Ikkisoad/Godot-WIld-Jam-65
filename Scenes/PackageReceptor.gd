extends Area2D

const PACKAGE_GP_NAME = "Package"
var hitScore : int = 20 

func _process(delta):
	position.x -= Autoload.xSpeed * 3

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group(PACKAGE_GP_NAME):
		Autoload.countScore(hitScore)
		body.DestroyPackage()


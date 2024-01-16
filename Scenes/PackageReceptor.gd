extends Area2D

const PACKAGE_GP_NAME = "Package" 

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group(PACKAGE_GP_NAME):
		body.DestroyPackage()


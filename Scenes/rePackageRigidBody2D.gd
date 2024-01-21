extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	linear_velocity.x = -195

func DestroyPackage():
	Autoload.countScore(50)
	queue_free()

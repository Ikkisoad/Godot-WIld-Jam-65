extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	linear_velocity.x = -195


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func DestroyPackage():
	print("The package has been collected")
	queue_free()

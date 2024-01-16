extends CharacterBody2D

@onready var timer = $Timer

const SPEED = 300.0
const JUMP_VELOCITY = -280.0
const MAX_Y_VELOCITY = 250
const DOWN_VELOCITY = 100
const package = preload("res://Scenes/released_pakcage.tscn")
#Speed up the plane fall
const GRAVITY_MULTIPLIER = 1.8

var packageCount = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

#func _ready():
	#package = preload("res://Scenes/package.tscn")

func _process(delta):
	if Input.is_action_pressed("release") && timer.is_stopped() && packageCount > 0:
		packageCount -= 1
		var releasePackage = package.instantiate()
		releasePackage.global_position.y += 50
		add_child(releasePackage)
		timer.start()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta * GRAVITY_MULTIPLIER
		if velocity.y > MAX_Y_VELOCITY:
			velocity.y = MAX_Y_VELOCITY

	if Input.is_action_pressed("up"):
		velocity.y = JUMP_VELOCITY
	if Input.is_action_pressed("down"):
		velocity.y += DOWN_VELOCITY
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func Die():
	queue_free()
	#I think that is useful to put here the death/gameOver sequence. e.g animation pause, set_process(false) etc etc

#func rotate():
	#rotation = 
	#pass
func collectPackage():
	packageCount += 1

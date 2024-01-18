extends Node2D

@export var receptors : PackedScene
@onready var spawnerPos: Marker2D = $SpawnerPos
@onready var spawnTimer: Timer = $SpawnTimer
@onready var receptorsHolder: Node = $ReceptorsHolder

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	InstanciateReceptors()
	spawnTimer.start()

func InstanciateReceptors():
	#Getting the Marker2D x Position
	var newXPos = spawnerPos.position.x
	#Instanciating the receptor
	var newReceptors = receptors.instantiate()
	#adding the new position to the newReceptor
	newReceptors.position = Vector2(newXPos, spawnerPos.position.y)
	#Adding new Receptors to be a child of receptorsHolder
	receptorsHolder.add_child(newReceptors)

func _on_spawn_timer_timeout() -> void:
	InstanciateReceptors()

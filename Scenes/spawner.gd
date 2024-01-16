extends Node2D

var spawnRate = 1

@onready var _1 = $"1"
@onready var _2 = $"2"
@onready var _3 = $"3"
@onready var _4 = $"4"
@onready var _5 = $"5"
@onready var _6 = $"6"
@onready var _7 = $"7"
@onready var _8 = $"8"
@onready var _9 = $"9"
@onready var _10 = $"10"
@onready var _11 = $"11"

const package = preload("res://Scenes/package.tscn")
const obstacle = preload("res://Scenes/obstacle_area.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().create_timer(randi_range(0,spawnRate)).timeout.connect(spawnPackage)
	get_tree().create_timer(randi_range(0,spawnRate)).timeout.connect(spawnObstacle)

func spawnPackage():
		var releasePackage = package.instantiate()
		releasePackage.global_position = getSpawnPoisition()
		add_child(releasePackage)
		get_tree().create_timer(randi_range(0,spawnRate)).timeout.connect(spawnPackage)
		
func spawnObstacle():
		var spawnedObstacle = obstacle.instantiate()
		spawnedObstacle.global_position = getSpawnPoisition()
		add_child(spawnedObstacle)
		get_tree().create_timer(randi_range(0,spawnRate)).timeout.connect(spawnObstacle)

func getSpawnPoisition():
	return Vector2(randi_range(0,1200), randi_range(0,640))

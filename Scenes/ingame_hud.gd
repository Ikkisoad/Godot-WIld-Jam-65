extends Control

@onready var score = $score
@onready var _1 = $"1"
@onready var _2 = $"2"
@onready var _3 = $"3"
@onready var package_1 = $Package1
@onready var package_2 = $Package2
@onready var package_3 = $Package3
@onready var package_4 = $Package4
@onready var package_5 = $Package5

var lives = 3
var scoreCount = 0

func _ready():
	Autoload.scoreCounted.connect(updateScore)
	Autoload.packageCollected.connect(updateScore)
	Autoload.died.connect(updateLives)
	Autoload.packageCollected.connect(updatePackages)

func updateScore():
	score.text = str(Autoload.score)

func updateLives():
	match Autoload.lives:
		2:
			_3.visible = false
		1:
			_2.visible = false
		0:
			_1.visible = false
			
func updatePackages():
	match Autoload.packages:
		1:
			package_1.visible = false
		2:
			package_2.visible = false
		3:
			package_3.visible = false
		4:
			package_4.visible = false
		5:
			package_5.visible = false

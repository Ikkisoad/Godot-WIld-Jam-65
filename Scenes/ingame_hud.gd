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
	Autoload.packageReleased.connect(updatePackages)
	setVisiblePackages(0,0,0,0,0)

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
		0: setVisiblePackages(false,false,false,false,false)
		1: setVisiblePackages(true,false,false,false,false)
		2: setVisiblePackages(true,true,false,false,false)
		3: setVisiblePackages(true,true,true,false,false)
		4: setVisiblePackages(true,true,true,true,false)
		5: setVisiblePackages(true,true,true,true,true)

func setVisiblePackages(one, two, three, four, five):
	package_1.visible = one
	package_2.visible = two
	package_3.visible = three
	package_4.visible = four
	package_5.visible = five

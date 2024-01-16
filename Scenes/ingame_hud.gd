extends Control

@onready var score = $score
@onready var _1 = $"1"
@onready var _2 = $"2"
@onready var _3 = $"3"

var lives = 3

var scoreCount = 0

func updateScore(value):
	scoreCount += value
	score.text = str(scoreCount)

func updateLives():
	lives -= 1
	#if lives <= 0:
	#I think that is useful to put here the death/gameOver sequence. e.g animation pause, set_process(false) etc etc
	match lives:
		2:
			_3.visible = false
		1:
			_2.visible = false
		0:
			_1.visible = false

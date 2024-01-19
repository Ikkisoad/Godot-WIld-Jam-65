extends Node

var score = 0
var lives = 3
var packages = 0

signal scoreCounted()
signal packageCollected()
signal died()
signal on_overload

func countScore(value):
	score += value
	scoreCounted.emit()

func collectPackage():
	score += 10
	packages += 1
	packageCollected.emit()
	if packages >= 5:
		on_overload.emit()

func playerDeath():
	lives -= 1
	died.emit()
	
func RemovePackages(value : float) -> void:
	packages -= value

extends Node

var score = 0
var lives = 3
var packages = 0

var xSpeed = 0.5

signal scoreCounted()
signal packageCollected()
signal died()
signal on_overload()
signal packageReleased()
signal off_overload()

func countScore(value):
	score += value
	speedUp()
	scoreCounted.emit()

func collectPackage():
	score += 10
	speedUp()
	packages += 1
	packageCollected.emit()
	if packages > 3:
		on_overload.emit()
	else:
		off_overload.emit()

func playerDeath():
	lives -= 1
	if packages > 3:
		packages = 3
	died.emit()
	
func RemovePackages() -> void:
	packages -= 1
	if packages < 4:
		off_overload.emit()
	packageReleased.emit()

func speedUp():
	if score > 50:
		xSpeed += 0.2
	if score > 250:
		xSpeed += 0.3
	if score > 500:
		xSpeed += 0.5

extends Node2D

@export var hud: Control

func updateScore(value):
	hud.updateScore(value)

func updateLives():
	hud.updateLives()

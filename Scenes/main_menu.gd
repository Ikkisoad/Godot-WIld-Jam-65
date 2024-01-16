extends Control

var gameScene : PackedScene = preload("res://Scenes/main.tscn")
var creditsScene : PackedScene = preload("res://Scenes/credits_scene.tscn")

func _on_endless_button_pressed() -> void:
	LoadGameScene()


func _on_arcade_button_pressed() -> void:
	print("Under development")


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_packed(creditsScene)

func LoadGameScene() -> void:
	get_tree().change_scene_to_packed(gameScene)

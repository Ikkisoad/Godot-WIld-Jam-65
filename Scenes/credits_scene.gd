extends Control

var mainMenuScene : PackedScene = preload("res://Scenes/main_menu.tscn")


func _on_back_button_pressed() -> void:
	LoadMainMenuScene()
	
func LoadMainMenuScene() -> void:
	get_tree().change_scene_to_packed(mainMenuScene)

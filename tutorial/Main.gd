extends Node2D

func _ready():
	Utils.save_game()

func _on_button_pressed():
	get_tree().change_scene_to_file("res://world.tscn") # Replace with function body.


func _on_button_2_pressed():
	get_tree().quit() # Replace with function body.

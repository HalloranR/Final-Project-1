extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



func _on_Start_Game_pressed():
	get_tree().change_scene("res://Scenes/Game.tscn")


func _on_Button2_pressed():
	get_tree().quit()

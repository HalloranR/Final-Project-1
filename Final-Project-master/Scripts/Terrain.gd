extends Node2D

var collision_mask = 19
var layer_mask = 4

func _ready():
	for n in get_children():
		if n.has_method("set_collision_mask"):
			n.set_collision_mask(collision_mask)  
			n.set_collision_layer(layer_mask) 
	for n in $Trees.get_children():
		if n.has_method("set_collision_mask"):
			n.set_collision_mask(collision_mask)  
			n.set_collision_layer(layer_mask) 

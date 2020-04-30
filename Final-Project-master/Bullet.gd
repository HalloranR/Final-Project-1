extends RigidBody2D

onready var Explosion = load("res://Scenes/Explosion.tscn")

func _ready():
	pass # Replace with function body.



func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()



func _on_Area2D_body_entered(body):
	var explosion = Explosion.instance()
	explosion.position = position

	
	get_node("/root/Game/Explosion").add_child(explosion)
	
	if body.get_parent().name == "Zombies":
		body.kill()
		queue_free()

	if body.get_parent().name == "Terrain":
		queue_free()

	if body.get_parent().name == "Trees":
		queue_free()

extends RigidBody2D


func _ready():
	pass # Replace with function body.



func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()



func _on_Area2D_body_entered(body):
	#play explosion
	if body.get_parent().name == "Zombies":
		body.kill()
		queue_free()

	if body.get_parent().name == "Terrain":
		queue_free()

	if body.get_parent().name == "Trees":
		queue_free()

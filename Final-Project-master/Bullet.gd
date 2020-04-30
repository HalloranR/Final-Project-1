extends RigidBody2D


func _ready():
	pass # Replace with function body.



func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()



func _on_Area2D_body_entered(body):
	#play explosion
	queue_free()

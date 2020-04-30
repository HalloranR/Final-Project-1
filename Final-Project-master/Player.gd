extends KinematicBody2D

onready var Bullet = load("res://Scenes/Bullet.tscn")
onready var Pivot = $Pivot
const MOVE_SPEED = 300
var health = 3
var score = 0

onready var raycast = $Pivot/RayCast2D
 
func _ready():
	yield(get_tree(), "idle_frame")
	get_tree().call_group("zombies", "set_player", self)

func shoot():
	var bullet = Bullet.instance()
	bullet.position = position
	bullet.rotate(Pivot.global_rotation)
	var f = Vector2(200, 0)
	f = f.rotated(Pivot.global_rotation)
	bullet.add_force(Vector2(0,0),f)
	get_node("/root/Game/Bullet").add_child(bullet)
	
 
func _physics_process(delta):
	var move_vec = Vector2()
	if Input.is_action_pressed("move_up"):
		move_vec.y -= 1
	if Input.is_action_pressed("move_down"):
		move_vec.y += 1
	if Input.is_action_pressed("move_left"):
		move_vec.x -= 1
	if Input.is_action_pressed("move_right"):
		move_vec.x += 1
		
	move_vec = move_vec.normalized()
	move_and_collide(move_vec * MOVE_SPEED * delta)
   
	var look_vec = get_global_mouse_position() - global_position
	Pivot.global_rotation = atan2(look_vec.y, look_vec.x)
   
	if Input.is_action_just_pressed("shoot"):
		shoot()
		
		var coll = raycast.get_collider()
		if raycast.is_colliding():
			if coll.has_method("kill"):
				#coll.kill()
				score += 100
 
func kill():
	health -= 1
	if health <=0:
		get_tree().reload_current_scene()


func _on_Area2D_body_entered(body):
	if body.name == "Zombie":
		health -=1
		if health <= 0:
			get_tree().reload_current_scene()

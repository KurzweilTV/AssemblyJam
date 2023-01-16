extends Node2D

var bulletScene = preload("res://Player/Bullet.tscn")

var cooldown = 0.5
var shotTime = 0.0
var damage = 1.5

var bulletSpeed = Vector2(2100,0)

func _ready():
	set_process(false)

func shoot():
	set_process(true)
	shotTime = cooldown
#	var theArm = get_parent().get_parent().get_parent() # oh God why
	var newBullet = bulletScene.instance()
	newBullet.global_position = $Muzzle.global_position
	newBullet.set_meta("damage",damage)
	newBullet.linear_velocity = bulletSpeed.rotated(global_rotation)
	newBullet.global_rotation = global_rotation
	get_tree().current_scene.add_child(newBullet)
	pass


func _process(delta):
	shotTime -= delta
	if shotTime < 0:
		if !Input.is_action_pressed("shoot"):
			set_process(false)
		else:
			shoot()
	

func _input(event):
	if event.is_action_pressed("shoot") and shotTime <= 0:
		shoot()


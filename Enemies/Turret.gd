extends Enemy

var bulletScene = preload("res://Enemies/Bullet.tscn")

var turnDir = 1

var shooting = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func shoot():
	$GunHolder.look_at(GlobalPlayer.controller.global_position + Vector2(0,-100))
	$FireTimer.start()
	var newBullet = bulletScene.instance()
	newBullet.global_position = $GunHolder/Muzzle.global_position
	newBullet.add_force(Vector2(),Vector2(1,0).rotated($GunHolder.rotation)*2000)
	newBullet.set_meta("damage",1.0)
	newBullet.rotation = $GunHolder.rotation
	get_tree().current_scene.call_deferred("add_child",newBullet)
	pass

func _physics_process(delta):
	if shooting:
		return
	$GunHolder.rotate(delta * 2 * turnDir)
	if $GunHolder.rotation > PI-0.1:
		turnDir = -1
	if $GunHolder.rotation < 0.1:
		turnDir = 1
	pass

func die():
	queue_free()

func _on_FireTimer_timeout():
	if $GunHolder/PlayerScanner.get_overlapping_bodies().size() > 0:
		shoot()
	else:
		shooting = false
	pass # Replace with function body.


func _on_PlayerScanner_body_entered(body):
	assert(body.is_in_group("Player"))
	if !shooting:
		shooting = true
		shoot()
	pass # Replace with function body.

extends Enemy

var bulletScene = preload("res://Enemies/Bullet.tscn")
var moveSpeed = 340

var shooting = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func turn_around():
	applied_force.x *= -1
	$Sprite.scale.x *= -1
	$DetectionRange.scale.x *= -1
	pass

func resume():
	shooting = false
	applied_force.x = moveSpeed * $Sprite.scale.x
	pass

func fire():
	applied_force.x = 0
	$FireTimer.start()
	var newBullet = bulletScene.instance()
	newBullet.global_position = $Sprite/Line2D2/Muzzle.global_position
	newBullet.add_force(Vector2(),Vector2($Sprite.scale.x*2000,0))
	newBullet.set_meta("damage",1.0)
	newBullet.scale.x = $Sprite.scale.x
	get_tree().current_scene.call_deferred("add_child",newBullet)
	pass

func _on_Tanky_body_entered(body):
	turn_around()
	pass # Replace with function body.

func die():
	queue_free()
	pass

func _on_GroundTimer_timeout():
	$Sprite/GroundScanner.update()
	if !$Sprite/GroundScanner.is_colliding():
		turn_around()
		yield(get_tree().create_timer(0.7),"timeout")


func _on_DetectionRange_body_entered(body):
	assert(body.is_in_group("Player"))
	if !shooting:
		shooting = true
		fire()
	pass # Replace with function body.


func _on_FireTimer_timeout():
	if $DetectionRange.get_overlapping_bodies().size() > 0:
		fire()
	else:
		resume()
		
	pass # Replace with function body.

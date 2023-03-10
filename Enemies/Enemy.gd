extends RigidBody2D

class_name Enemy

var isClone = false

var linkedCloner = null

var selfCloner = preload("res://Enemies/EnemyRespawner.tscn")

var junkScene = preload("res://Enemies/Junk.tscn")

var dead = false

func _ready():
	if !isClone :
		var newCloner = selfCloner.instance()
		newCloner.cloneReference = self.duplicate()
		newCloner.global_position = global_position
		linkedCloner = newCloner
		get_tree().current_scene.call_deferred("add_child",newCloner)
	add_to_group("Enemy")

export var health = 2.0

func _process(delta):
	if modulate.g < 1:
		modulate.g += delta
		modulate.b += delta

func get_damaged(value):
	health -= value
	modulate.g = 0
	modulate.b = 0
	
	if health < 0:
		die()
	pass

func spawn_junk():
	var junkCount = 5 + randi()%4
	while junkCount > 0:
		junkCount -= 1
		var newJunk = junkScene.instance()
		newJunk.global_position = global_position
		newJunk.call_deferred("apply_central_impulse",2000*Vector2(randf()-0.5,randf()-0.5))
		get_tree().current_scene.call_deferred("add_child",newJunk)

func die():
	print("you should not see this message as the 'die' fucntion should be overwrtitten on all enemies" )
	# play death animation
	pass

func _exit_tree():
	linkedCloner.ress_me()

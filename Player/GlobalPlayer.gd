extends Node


var controller : KinematicBody2D

var UI

var maxHealth = 5.0

var currentHealth = 5.0

var currentSpawn = null

func _ready():
	set_process(false)
	

func damage(value):
	currentHealth -= value
	UI.update_health(currentHealth)
	if currentHealth < 0.5 :
		controller.die()
	pass

func set_spawn(newSpawn):
	if currentSpawn!=null:
		if is_instance_valid(currentSpawn):
			currentSpawn.activate(false)
	currentSpawn = newSpawn
	pass

func respawn():
	if currentSpawn != null :
		if is_instance_valid(currentSpawn):
			# respawn player at chepoint
			print("respawn player")
	pass

func free_controller(oldController):
	assert(oldController == controller) 
	set_process(false)

func set_controller(newController):
	controller = newController
	currentHealth = maxHealth
	UI = get_tree().get_nodes_in_group("UI")[0]
	UI.update_health(currentHealth)
	set_process(true)
	

func _process(delta):
	# update stuff
	pass

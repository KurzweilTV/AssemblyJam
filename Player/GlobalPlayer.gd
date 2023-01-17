extends Node

var playerControllerScene = preload("res://Player/Player.tscn")

var controller : KinematicBody2D

var UI

var maxHealth = 5.0

var currentHealth = 3.0

var currentSpawn = null
	

func damage(value):
	currentHealth -= value
	UI.update_health(currentHealth)
	if currentHealth < 0.5 :
		controller.die()
	pass

func heal(value):
	currentHealth += value
	if currentHealth > maxHealth:
		currentHealth = maxHealth
	UI.update_health(currentHealth)

func free_controller(oldController):
	assert(oldController == controller) 
	oldController.queue_free()

func set_controller(newController):
	controller = newController
	currentHealth = maxHealth
	UI = get_tree().get_nodes_in_group("UI")[get_tree().get_nodes_in_group("UI").size()-1] # dunno why this -1 needs to be here, but it's late and I can' be bothered
	UI.update_health(currentHealth)

	
func set_spawn(newSpawn):
	if currentSpawn!=null:
		if is_instance_valid(currentSpawn):
			currentSpawn.activate(false)
	currentSpawn = newSpawn


func respawn():
	if currentSpawn != null :
		if is_instance_valid(currentSpawn):
			# respawn player at chepoint
			controller.queue_free()
			UI.queue_free()
			var newController = playerControllerScene.instance()
			newController.global_position = currentSpawn.global_position
			currentSpawn.open()
			get_tree().current_scene.add_child(newController)
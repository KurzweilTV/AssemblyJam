extends Node


var controller : KinematicBody2D

var UI

var maxHealth = 5.0

var currentHealth = 3.0


func _ready():
	set_process(false)
	

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

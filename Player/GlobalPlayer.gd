extends Node


var controller : KinematicBody2D

var UI

var maxHealth = 5.0

var currentHealth = 5.0



func _ready():
	set_process(false)
	

func damage(value):
	currentHealth -= value
	UI.update_health(currentHealth)
	if currentHealth < 0.5 :
		print("you died, RIP")
	pass


func free_controller(oldController):
	assert(oldController == controller) 
	set_process(false)

func set_controller(newController):
	controller = newController
	UI = get_tree().get_nodes_in_group("UI")[0]
	UI.update_health(currentHealth)
	set_process(true)
	

func _process(delta):
	# update stuff
	pass

extends Node


var controller = null

var maxHealth = 5.0

var currentHealth = 5.0

func _ready():
	set_process(false)

func damage(value):
	currentHealth -= value
	if currentHealth < 0 :
		print("you died, RIP")
	pass


func free_controller(oldController):
	assert(oldController == controller) 
	set_process(false)

func set_controller(newController):
	controller = newController
	set_process(true)

func _process(delta):
	# update stuff
	pass

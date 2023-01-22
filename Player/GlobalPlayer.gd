extends Node

var playerControllerScene = preload("res://Player/Player.tscn")

var controller : Player

var UI

var playerGun = null

var maxHealth = 5.0

var maxEnergy = 100.0

var currentEnergy = 100.0

var currentHealth = 5.0

var currentSpawnID = null

var gunTestUnlocked = false

var allSpawns = {}

func use_energy(amount) ->  bool:
	if amount > currentEnergy :
		return false
	else:
		currentEnergy -= amount
		return true
	pass

func _process(delta):
	currentEnergy += delta * 5
	currentEnergy = min(currentEnergy, maxEnergy)

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

func set_controller(newController):
	controller = newController
	currentHealth = maxHealth
	UI = get_tree().get_nodes_in_group("UI")[get_tree().get_nodes_in_group("UI").size()-1] # dunno why this -1 needs to be here, but it's late and I can' be bothered
	UI.update_health(currentHealth)

	
func set_spawn(newSpawnID):
	if currentSpawnID!=null:
		allSpawns[currentSpawnID].activate(false)
	currentSpawnID = newSpawnID
	
func register_spawn(ID, instance):
#	assert(!allSpawns.has(ID))
	allSpawns[ID] = instance
	pass

func respawn():
	assert	(currentSpawnID != null)
	# respawn player at chepoint
	var newController = playerControllerScene.instance()
	newController.global_position = allSpawns[currentSpawnID].global_position
	allSpawns[currentSpawnID].open()
	get_tree().current_scene.add_child(newController)
	

extends Area2D

var health = 100.0
var droppables = { # a weighted list of the items dropped on death
	"droppable": 0.5
}

func _ready() -> void:
	randomize()

func _process(delta: float) -> void:
	test_damage()

func take_damage(amount) -> void:
	health -= amount
	if health <= 0:
		# Play Death Animation
		drop_inventory()
		self.queue_free()

func drop_inventory():
	var location = self.global_position
	var drop_chance = rand_range(0.0,1.0)
	
	for item in droppables:
		if drop_chance <= droppables[item]:
			print_debug("Dropped ",item, " at ", location)
		else:
			print_debug("Nothing Dropped")

func test_damage():
	if Input.is_action_just_released("ui_accept"):
		take_damage(25)
		print_debug(health)

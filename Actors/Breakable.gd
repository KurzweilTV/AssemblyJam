extends Area2D

var health = 100.0
var droppables = { # a weighted list of the items dropped on death
	"droppable": 0.5
}

func _ready() -> void:
	randomize()

func _process(_delta: float) -> void:
	test_damage()

func take_damage(amount) -> void:
	var anim = $AnimationPlayer
	health -= amount
	anim.play("damage")
	if health <= 0:
		death()

func death():
	$Explosion.show()
	$Smoke.emitting = true
	$Sparks.emitting = true
	$Explosion.play("explosion")
	$Sprite.hide()
	$Smoke.emitting = true
	drop_inventory()
	yield($Explosion,"animation_finished")
	$Explosion.hide()

func drop_inventory():
	var location = self.global_position
	var drop_chance = rand_range(0.0,1.0)
	
	for item in droppables:
		if drop_chance <= droppables[item]:
			print_debug("Dropped ",item, " at ", location)
		else:
			print_debug("Nothing Dropped")

func test_damage(): # test damage by pressing space/return
	if Input.is_action_just_released("ui_accept"):
		take_damage(125)
		print_debug(health)

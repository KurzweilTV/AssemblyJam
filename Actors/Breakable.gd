extends Area2D

var droppables = { # a weighted list of the items dropped on death
	"scrap": 0.5 #item and pct chance it will drop
}

func _ready() -> void:
	randomize()

func death():
	$Explosion.show()
	$Smoke.emitting = true
	$Sparks.emitting = true
	$Explosion.play("explosion")
	$Intact.hide()
	$Broken.show()
	$CollisionShape2D.disabled = true
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

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("break_test"):
		print("Boom")
		death()


func _on_Breakable_area_entered(area: Area2D) -> void:
	death()


func _on_Breakable_body_entered(body: Node) -> void:
	death()

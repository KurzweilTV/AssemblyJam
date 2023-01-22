extends Area2D

const health_amount := 2.5

func _item_pickup(body: Node) -> void:
	if GlobalPlayer.currentHealth < GlobalPlayer.maxHealth:
		GlobalPlayer.heal(health_amount)

		$Sprite.hide()
		$Bubbles.hide()
		$CPUParticles2D.emitting = true
		$Timer.start()

func _on_Timer_timeout() -> void: # remove after the particles are done animating
	self.queue_free()

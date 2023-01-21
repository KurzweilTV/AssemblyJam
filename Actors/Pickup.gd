extends Area2D

const health_amount := 2.0
var currentHP = GlobalPlayer.currentHealth
var maxHP = GlobalPlayer.maxHealth

func _item_pickup(body: Node) -> void:
	if body.is_in_group("Player") and currentHP < maxHP:
		GlobalPlayer.heal(health_amount)

		$Sprite.hide()
		$CPUParticles2D.emitting = true
		$Timer.start()

func _on_Timer_timeout() -> void:
	self.queue_free()

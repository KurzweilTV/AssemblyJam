extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if GameManager.bossesKilled["drone"]:
		$DroneStart.queue_free()
		$Path2D.queue_free()
	else:
		$"../Doors/BossDoor3".locked = true
	if GameManager.bossesKilled["turret"]:
		$TurretStart.queue_free()
		$BossTurret.queue_free()
	else:
		$"../Doors/BossDoor2".locked = true
	if !GameManager.voiceClipHistory.has(5):
		$"../Doors/BossDoor1".locked = true



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_TurretStart_body_entered(body):
	$BossTurret.start_boss()
	$"../Doors/YellowBoss".locked = true
	$TurretStart/CollisionShape2D.set_deferred("disabled",true)
	pass # Replace with function body.


func _on_DroneStart_body_entered(body):
	$Path2D/BossDrone.start_boss()
	$"../Doors/BlueBoss".locked = true
	$DroneStart/CollisionShape2D.set_deferred("disabled",true)
	pass # Replace with function body.


func _on_BossTurret_boss_death():
	$"../Doors/YellowBoss".locked = false
	GameManager.trigger_action(8)
	GameManager.bossesKilled["turret"] = true
	$"../Doors/BossDoor2".locked = false
	GlobalPlayer.heal(10)
	pass # Replace with function body.


func _on_BossDrone_boss_death():
	$"../Doors/BlueBoss".locked = false
	GameManager.trigger_action(14)
	$"../Doors/BossDoor3".locked = false
	GlobalPlayer.heal(10)
	GameManager.bossesKilled["drone"] = true
	pass # Replace with function body.


func _on_HeadStart_body_entered(body):
	$HeadBoss.start_boss()
	$"../Doors/BossDoor1".locked = true
	pass # Replace with function body.
	
	
func _on_SpeicalDoorUnlock_body_entered(body):
	$"../Doors/BossDoor1".locked = false
	pass # Replace with function body.

extends Node2D

func _ready() -> void:
	$Credits.modulate.a = 0.0
	$AudioStreamPlayer2D.play()
	$Timer.start()
	$CreditsTimer.start()
	
func end_the_game() -> void:
	$Label.show()
	
func show_credits() -> void:
	$Label.hide()
	print("Playing Animation")
	$AnimationPlayer.play("fade_in")
	


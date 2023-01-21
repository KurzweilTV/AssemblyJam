extends CanvasLayer


func update_health(newHealth):
	$"%HealthBar".value = newHealth
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	$Curtain.visible = true
	$AnimationPlayer.play("In")
	get_tree().paused = true
	pass # Replace with function body.

func load_voice(text : String, clip : String):
	$VoicePlayer.stream = load("res://Test/"+clip+".wav")
	$VoicePlayer.play()
	$"%TextBox".text = text
	$"%TextPrinter".play("Print")
	pass


func _process(delta):
	$"%EnergyBar".value = GlobalPlayer.currentEnergy

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "In":
		get_tree().paused = false
	pass # Replace with function body.

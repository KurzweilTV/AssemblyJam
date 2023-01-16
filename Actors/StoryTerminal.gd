extends Area2D

var story_text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit" \
	+ "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua." \
	+ "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi" \
	+ "ex ea commodo consequat."

func _ready() -> void:
	$StoryUI/StoryText.text = story_text


func _on_StoryTerminal_body_entered(body: Node) -> void:
	$StoryUI.show()
	$AnimationPlayer.play("Open")



func _on_StoryTerminal_body_exited(body: Node) -> void:
	$AnimationPlayer.play_backwards("Open")
	yield($AnimationPlayer,"animation_finished")
	$StoryUI.hide()

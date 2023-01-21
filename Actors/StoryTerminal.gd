extends Area2D

var window_visible = false
export var story_text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit"

func _ready() -> void:
	$StoryUI/StoryText.text = story_text
	
func _on_StoryTerminal_body_entered(body: Node) -> void:
	if ! window_visible:
		$StoryUI.show()
		$AnimationPlayer.play("Open")
		yield($AnimationPlayer,"animation_finished")
		window_visible = true

func _on_StoryTerminal_body_exited(body: Node) -> void:
	if window_visible:
		$AnimationPlayer.play_backwards("Open")
		yield($AnimationPlayer,"animation_finished")
		$StoryUI.hide()
		window_visible = false

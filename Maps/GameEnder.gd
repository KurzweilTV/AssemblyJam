extends Area2D


func _on_GameEnder_area_entered(area: Area2D) -> void:
	get_tree().change_scene("res://Maps/Credits.tscn")


func end_game(body: Node) -> void:
	get_tree().change_scene("res://Maps/Credits.tscn")

extends Node2D

var locked = false
var open = false

export var trigger = NodePath()

onready var top = $DoorTop
onready var bottom = $DoorBottom

func _ready() -> void:
	if trigger != "":
		locked = true
		get_node(trigger).connect("activate",self,"door_unlock")
	pass

func door_open() -> void:
	if ! open:
		var tween = create_tween()
		tween.tween_property(top, "position:y", (top.position.y - 200), 0.2)
		tween.parallel().tween_property(bottom, "position:y", (bottom.position.y + 200), 0.2)
		yield(tween,"finished")
		open = true

func door_close() -> void:
	if open:
		var tween = create_tween()
		tween.tween_property(top, "position:y", (top.position.y + 200), 0.2)
		tween.parallel().tween_property(bottom, "position:y", (bottom.position.y - 200), 0.2)
		yield(tween,"finished")
		open = false

func door_unlock():
	locked = false
	pass


func _on_Door_body_entered(body):
	if locked:
		return
	door_open()
	pass # Replace with function body.


func _on_Door_body_exited(body):
	if locked:
		return
	door_close()
	pass # Replace with function body.

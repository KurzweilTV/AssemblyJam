extends Node2D

onready var top = $DoorTop
onready var bottom = $DoorBottom

func _ready() -> void:
	pass

func door_open() -> void:
	var tween = create_tween()
	tween.tween_property(top, "position:y", (top.position.y - 100), 0.2)
	tween.parallel().tween_property(bottom, "position:y", (bottom.position.y + 100), 0.2)

func door_close() -> void:
	var tween = create_tween()
	tween.tween_property(top, "position:y", (top.position.y + 100), 0.3)
	tween.parallel().tween_property(bottom, "position:y", (bottom.position.y - 100), 0.3)

func _door_sensor_on(area: Area2D) -> void:
	door_open()

func _door_sensor_off(area: Area2D) -> void:
	door_close()

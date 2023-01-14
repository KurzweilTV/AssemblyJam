extends Particles2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var forward = 1.0

func super_set_point(value):
	process_material.scale_curve.curve.set_point_value(1, value)
# Called when the node enters the scene tree for the first time.
func _ready():
	$Tween.interpolate_method(self, "super_set_point", (1.0-forward)/2.0,(1.0+forward)/2.0,1.0, Tween.TRANS_ELASTIC)
	$Tween.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Tween_tween_completed(object, key):
	forward *= -1
	$Tween.interpolate_method(self, "super_set_point", (1.0-forward)/2.0,(1.0+forward)/2.0,1.5, Tween.TRANS_ELASTIC)
	pass # Replace with function body.

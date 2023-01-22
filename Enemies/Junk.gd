extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var sprites = $Sprites.get_children() as Array
	while sprites.size() > 1:
		var pick = randi()%sprites.size()
		sprites[pick].visible = false
		sprites.erase(sprites[pick])
	angular_velocity = (randf()-0.5) * 20
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

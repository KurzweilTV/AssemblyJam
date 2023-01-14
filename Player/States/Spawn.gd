extends State


func _ready():
	yield(owner, "ready")

func enter(_msg: Dictionary = {}):
	pass

func exit() :
	pass

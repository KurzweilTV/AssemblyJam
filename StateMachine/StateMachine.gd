extends Node

class_name StateMachine, "res://StateMachine/state_machine.svg"

export var initialState : NodePath

onready var state = get_node(initialState) as State

func _ready():
	yield(owner,"ready")
	for c in get_children():
		c.stateMachine = self
		c.set_process(false)
		c.set_physics_process(false)
	activate_state()


func transition_to(targetState : String, msg = {}): # change state to targetState and pass to it msg
	if not has_node(targetState):
		print("no such state as: ",targetState," in state machine: ", self)
		return
	yeet_state()
	state = get_node(targetState) as State
	activate_state(msg)


func activate_state(msg = {}):
	state.enter(msg)
	state.set_process(true)
	state.set_physics_process(true)


func yeet_state():
	state.set_process(false)
	state.set_physics_process(false)
	state.exit()

extends Node2D
class_name Weapon

export var playerAttack = false

export var damage = 1.0

export var ammo = 6

export var cooldown = 0.7

export var attackTime = 0.5

onready var cooldownTimer = Timer.new()

var shooting = false

var attackNode = null

var reloading = false

func _ready():
	cooldownTimer.wait_time = cooldown
	cooldownTimer.one_shot = true
	cooldownTimer.connect("timeout",self,"reload_complete")
	add_child(cooldownTimer)
	if has_node("AreaAttack"): # this is an AOE attack
		attackNode = get_node("AreaAttack") as Area2D
		attackNode.set_collision_layer_bit(2,playerAttack) # makes it an Enemy attack
		attackNode.set_collision_layer_bit(4,!playerAttack) # makes it a Player attack
		attackNode.set_meta("damage",damage)
	elif has_node("Shooter"): # this is a pew pew gun
		attackNode = get_node("Shooter")
		attackNode.damage = damage
		attackNode.playerAttack = playerAttack
	assert(attackNode!=null)
		

func reload_complete():
	reloading = false
	if shooting:
		fire()
	pass

func fire():
	if !reloading:
		shooting = true
		cooldownTimer.start()
		reloading = true
		$Animator.play("Fire")
		attackNode.shoot()


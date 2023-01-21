extends Node2D

export var testUnLocked = true
var unLocked = false

var unlockedGuns = []

var currentGun = 0


func _ready():
	GlobalPlayer.playerGun = self
	if testUnLocked:
		unlock("basicGun")
		unlock("fireGun")
		unlock("hunterGun")
		unlock("bouncyGun")



func shoot():
	unlockedGuns[currentGun].fire()
	pass

func unlock(name):
	
	unLocked = true
	match name:
		"basicGun" :
			unlockedGuns.push_back($Guns/BasicGun)
			$Guns/BasicGun.visible = true
			pass
		"bouncyGun" :
			unlockedGuns.push_back($Guns/BouncyGun)
			pass
			
		"hunterGun" :
			unlockedGuns.push_back($Guns/HunterGun)
			pass
			
		"fireGun" :
			unlockedGuns.push_back($Guns/FlameThrower)
			pass
			
	pass


func _input(event):
	if !unLocked:
		return
	if event.is_action_pressed("swap"):
		unlockedGuns[currentGun].visible = false
		var gunCount = unlockedGuns.size()
		if gunCount < 2: # there is only 1 gun
			return
		if currentGun == gunCount-1:
			currentGun = 0
		else:
			currentGun += 1
		
		
		unlockedGuns[currentGun].visible = true
	if event.is_action_pressed("shoot"):
		shoot()
	if event.is_action_released("shoot"):
		for G in $Guns.get_children():
			G.shooting = false


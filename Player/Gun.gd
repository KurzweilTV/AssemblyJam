extends Node2D

var unLocked = false

var unlockedGuns = []

var currentGun = 0


func _ready():
	GlobalPlayer.playerGun = self
	if GlobalPlayer.gunTestUnlocked:
		unlock("basicGun")
		unlock("fireGun")
		unlock("hunterGun")
		unlock("bouncyGun")
	for G in GameManager.unlockedPlayerSkills:
		if GameManager.unlockedPlayerSkills[G]:
			unlock(G)
		else:
			print(G, " still locked")


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
		for G in $Guns.get_children():
			G.shooting = false
		if currentGun == gunCount-1:
			currentGun = 0
		else:
			currentGun += 1
		if Input.is_action_pressed("shoot"):
			shoot()
		
		unlockedGuns[currentGun].visible = true
	if event.is_action_pressed("shoot"):
		shoot()
	if event.is_action_released("shoot"):
		for G in $Guns.get_children():
			G.shooting = false


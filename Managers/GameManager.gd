extends Node

var unlockedPlayerSkills = {
	"gun" : false,
	
	
}

func unlock_skill(name):
	assert(unlockedPlayerSkills.has(name))
	unlockedPlayerSkills[name] = true
	match name:
		"gun":
			GlobalPlayer.playerGun.locked = false
	pass

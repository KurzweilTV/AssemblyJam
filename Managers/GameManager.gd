extends Node

var unlockedPlayerSkills = {
	"gun" : false,
}

func unlock_skill(name):
	assert(unlockedPlayerSkills.has(name))
	unlockedPlayerSkills[name] = true
	match name:
		"gun":
			GlobalPlayer.playerGun.unLocked = true
	pass

func get_skill_state(name):
	assert(unlockedPlayerSkills.has(name))
	return unlockedPlayerSkills[name]

func update_save():
	$StoryTracker.unlockedPlayerSkills = unlockedPlayerSkills.duplicate()
	pass


func load_game():
	unlockedPlayerSkills = $StoryTracker.unlockedPlayerSkills.duplicate()
	pass

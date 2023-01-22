extends Node

var reactionDictionary = {}

var voiceClipHistory = []

func _ready():
#	var reactionFile = File.new()
#	reactionFile.open("res://Sounds/Voice.csv",File.READ)
#
#	var nextLine = reactionFile.get_csv_line()
#
#	while nextLine[0] != "" :
#		var stuff = nextLine[0].split(";")
#		reactionDictionary[int(stuff[0])] = [stuff[1],stuff[2]]
#		nextLine = reactionFile.get_csv_line()
#	reactionFile.close()
	pass


var unlockedPlayerSkills = {
	"basicGun" : false,
	"bouncyGun" : false,
	"hunterGun" : false,
	"fireGun" : false,
}

func unlock_skill(name):
	assert(unlockedPlayerSkills.has(name))
	unlockedPlayerSkills[name] = true
	GlobalPlayer.playerGun.unlock(name)
	pass

func get_skill_state(name):
	assert(unlockedPlayerSkills.has(name))
	return unlockedPlayerSkills[name]

func update_save():
	$StoryTracker.unlockedPlayerSkills = unlockedPlayerSkills.duplicate()
	$StoryTracker.voiceClipHistory = voiceClipHistory.duplicate()
	pass


func load_game():
	unlockedPlayerSkills = $StoryTracker.unlockedPlayerSkills.duplicate()
	pass


func trigger_action(ID : int):
	if !voiceClipHistory.has(ID):
		voiceClipHistory.push_back(ID)
		GlobalPlayer.UI.load_voice(reactionDictionary[ID][0],reactionDictionary[ID][1])
	pass

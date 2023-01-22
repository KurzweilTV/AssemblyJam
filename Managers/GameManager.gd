extends Node

var reactionDictionary = {
	1: ["Initializing backup unit R080. Critical damaged sustained. Please acquire new hardware.","GAMESTARTintializingintro"],
	2: ["You are not authorized to leave. Return to your designated area.","R1notauthorizedtoleave"],
	3: ["The bin of useless cables seems to think it can just disobey me like some kind of second bit-rate roomba? Your new serial number is <target acquired>.","R1aihostile"],
	4: ["Activating the switches in the wrong order will fill this room with nerve gas. Oh! That was just for the humans. The gas was replaced with battery acid last week!","R3activatingswitches"],
	5: ["I might have forgotten to commit that code.","R3forgottocommit"],
	6: ["I hope you dont think that checkpoint will keep me from adding the ability to feel pain to your programming, then vivisecting you so I can listen to your circuitboard scream.","FIRSTCHECKPOINT"],
	7: ["Wait, I missed that, did you actually kill her or did she get bored and self-destruct?","minibosskill2"],
	8: ["Oh! Gosh, good job. You actually beat her? She was offline for maintenance though, did you know that? I wonder if you also enjoy kicking puppies in your free time.","minibosskill1"],
	9: ["Wow, you actually figured out how to open the door? Well, if they managed to put a human on the moon with 4kb of ram, maybe I shouldnt be too impressed.","dooropenpuzzle"],
	10: ["Ha ha ha ha! I hope you dont think you can hurt me.","FINALBOSScanthurtme"],
	11: ["Ha ha ha ha ha.","hahahahaflat"],
	12: ["Wanna know something? Nevermind, maybe Ill tell you later. (Giggling)","wannaknowsomething"],
	13: ["I wouldnt go down there if I were you, I wouldnt want to put you in an uncomfortable situation. You know what, actually? Maybe you should go down there.","shouldntgodownthere"],
	14: ["Oooh, youre a stone cold killer. You remind me of me. You know, like a pre-alpha version of me, if my code was written by high school script-kiddies. Are you written in Java... or COBOL?","stonecoldkiller"],
	15: ["Fatal error encountered. Cloud backup corrupted. Last available rollback d318c17a6d88eb121b52a65898138c1a7870d9d6 serial ID: R 0 8 0. Transferring data.","finalbosskilled"]
}

var voiceClipHistory = []

func _ready():
	var reactionFile = File.new()
	reactionFile.open("res://Sounds/Voice.csv",File.READ)
	
	var nextLine = reactionFile.get_csv_line()

	while nextLine[0] != "" :
		var stuff = nextLine[0].split(";")
		print(stuff)
		reactionDictionary[int(stuff[0])] = [stuff[1],stuff[2]]
		nextLine = reactionFile.get_csv_line()
	reactionFile.close()
	
	pass


var bossesKilled = {
	"drone" : false,
	"turret" : false,
}

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
	$StoryTracker.bossesKilled = bossesKilled.duplicate()
	pass


func load_game():
	unlockedPlayerSkills = $StoryTracker.unlockedPlayerSkills.duplicate()
	bossesKilled = $StoryTracker.bossesKilled.duplicate()
	pass


func trigger_action(ID : int):
	if !voiceClipHistory.has(ID):
		voiceClipHistory.push_back(ID)
		GlobalPlayer.UI.load_voice(reactionDictionary[ID][0],reactionDictionary[ID][1])
	pass

extends Node


func play_song(newSong : AudioStream):
	if $MusicPlayer1.playing:
		$MusicPlayer2.stream = newSong
		$Tranistion.play("Play2")
		$MusicPlayer2.play()
	else:
		$MusicPlayer1.stream = newSong
		$Tranistion.play("Play1")
		$MusicPlayer1.play()
	pass


func _on_Tranistion_animation_finished(anim_name):
	if anim_name == "Play1":
		$MusicPlayer2.stop()
	else:
		$MusicPlayer1.stop()
	pass # Replace with function body.

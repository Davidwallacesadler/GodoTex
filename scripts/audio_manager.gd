class_name AudioManager
extends Node

@export var music: AudioStream
@export var sound_effect: AudioStream

func _ready():
	_setup_music()
	

func _setup_music():
	if music:
		$MusicAudioStreamPlayer.stream = music
		play_music()
		

func play_music():
	$MusicAudioStreamPlayer.play()
	

func pause_music():
	$MusicAudioStreamPlayer.stream_paused = true
	

func resume_music():
	$MusicAudioStreamPlayer.stream_paused = false
	

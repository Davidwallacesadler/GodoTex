class_name AudioManager
extends Node

@export var music: AudioStream
@export var sound_effect: AudioStream

var _is_playing_quip := false
var _music_decrease_amount := 5.0

func _ready():
	_setup_music_player()
	_setup_quip_player()
	GameEvents.item_investigated.connect(_on_item_investigated)
	

func _setup_music_player():
	if music:
		$MusicAudioStreamPlayer.stream = music
		$MusicAudioStreamPlayer.play()
		

func _setup_quip_player():
	$QuipAudioStreamPlayer.finished.connect(_on_quip_finished)
	

func _play_quip(quip: Quip):
	$MusicAudioStreamPlayer.volume_db = -_music_decrease_amount
	$QuipAudioStreamPlayer.stream = quip.audio
	$QuipAudioStreamPlayer.play()
#	_is_playing_quip = true
	

func _on_quip_finished():
	$MusicAudioStreamPlayer.volume_db = 0
	

func _on_item_investigated(quip: Quip):
	_play_quip(quip)
	

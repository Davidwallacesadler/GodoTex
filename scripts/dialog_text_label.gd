extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	GameEvents.item_investigated.connect(_on_item_investigated)
	GameEvents.quip_finished_playing.connect(_on_quip_finished_playing)

func _on_item_investigated(quip: Quip):
	self.text = quip.transcription
	

func _on_quip_finished_playing():
	self.text = ""

class_name WorldItem
extends StaticBody3D

@export var inventory_item: InventoryItem
@export var quip: Quip
@export var primary_action: Action = Action.INVESTIGATE

var current_action := Action.INVESTIGATE

func on_player_investigated():
	GameEvents.item_investigated.emit(quip)
	current_action = primary_action
	

func on_player_pick_up():
	GameEvents.item_picked_up.emit(inventory_item)
	queue_free()
	

enum Action {
	INVESTIGATE, PICK_UP, TOGGLE_ON_OFF, OPEN_CLOSE, MOVE
}

extends VBoxContainer

@export_category("Controls")
@export var item_list: ItemList
@export var up_button: Button
@export var down_button: Button
@export var use_button: Button
@export var combine_button: Button
@export var examine_button: Button
@export var thumbnail_texture: TextureRect

var _inventory: Array[InventoryItem] = []

var _selected_item: InventoryItem

func _ready():
	_setup_item_list()
	examine_button.pressed.connect(_on_examine_button_clicked)
	GameEvents.item_picked_up.connect(_on_item_picked_up)

func _setup_item_list():
	for item in _inventory:
		item_list.add_item(item.name)
	
	item_list.item_selected.connect(_on_item_selected)
	

func _on_item_selected(index: int):
	_selected_item = _inventory[index]
	_setup_thumbnail_image()
	

func _setup_thumbnail_image():
	if _selected_item:
		thumbnail_texture.texture = _selected_item.thumbnail_image
		

func _on_examine_button_clicked():
	if _selected_item:
		pass
		

func _on_item_picked_up(item: InventoryItem):
	_inventory.append(item)
	item_list.add_item(item.name)

extends VBoxContainer

@export var _items: Array[InventoryItem] = []

@export_category("Controls")
@export var _item_list: ItemList
@export var _up_button: Button
@export var _down_button: Button
@export var _use_button: Button
@export var _combine_button: Button
@export var _examine_button: Button
@export var _thumbnail_texture: TextureRect

var _selected_item: InventoryItem

func _ready():
	_setup_item_list()
	_examine_button.pressed.connect(_on_examine_button_clicked)

func _setup_item_list():
	for item in _items:
		_item_list.add_item(item.name)
	
	_item_list.item_selected.connect(_on_item_selected)
	

func _on_item_selected(index: int):
	_selected_item = _items[index]
	_setup_thumbnail_image()
	

func _setup_thumbnail_image():
	if _selected_item:
		_thumbnail_texture.texture = _selected_item.thumbnail_image
		

func _on_examine_button_clicked():
	if _selected_item:
		pass

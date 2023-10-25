class_name InventoryItem
extends Resource

@export var name: String = ""
@export var description: String = ""
@export var combines_with: Array[InventoryItem] = []
@export var thumbnail_image: Texture = preload("res://assets/textures/icon.svg")
@export var examination_scene: Resource

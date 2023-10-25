class_name InventoryItem
extends Resource

@export var name: String = ""
@export var description: String = ""
@export var combinesWith: Array = []
@export var thumbnailImage: Texture = preload("res://assets/textures/icon.svg")
@export var examinationScene: Resource

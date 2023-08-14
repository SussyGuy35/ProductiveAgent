extends Node2D


onready var trash1 = preload("res://trash/trash1.png")
onready var trash2 = preload("res://trash/trash2.png")
onready var trash3 = preload("res://trash/trash3.png")
onready var trash4 = preload("res://trash/trash4.png")

onready var trashs = [trash1, trash2, trash3, trash4]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite.set_texture(trashs[randi()%trashs.size()])


func _on_DisappearTimer_timeout() -> void:
	queue_free()

extends Node2D


# Declare member variables here. Examples:
var screen_size: Vector2
var window_size: Vector2
var hsp = rand_range(100,300)
var vsp = rand_range(100,300)
var hdir = 1
var vdir = 1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().get_root().set_transparent_background(true)
	screen_size = OS.get_screen_size()
	window_size = get_viewport().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("switch_border"):
		OS.window_borderless = !OS.window_borderless
	OS.window_position += Vector2(hsp*hdir,vsp*vdir)*delta
	if OS.window_position.x <= 0 or (OS.window_position.x+window_size.x) >= screen_size.x:
		$ProductiveSound.play()
		hdir *= -1
		hsp = rand_range(100,300)
	if OS.window_position.y <= 0 or (OS.window_position.y+window_size.y) >= screen_size.y:
		$ProductiveSound.play()
		vdir *= -1
		vsp = rand_range(100,300)


func no_more_productive() -> void:
	get_tree().quit()

extends Node2D

onready var trash = preload("res://Trash.tscn")

var screen_size: Vector2
var window_size: Vector2
var viewport_size: Vector2
var hsp = rand_range(100,300)
var vsp = rand_range(100,300)
var hdir = 1
var vdir = 1

func _ready() -> void:
	get_tree().get_root().set_transparent_background(true)
	screen_size = OS.get_screen_size()
	OS.set_window_size(screen_size)
	OS.set_window_position(Vector2(0,0))
	window_size = OS.get_window_size()
	viewport_size = get_viewport().size
	position = screen_size/2

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("switch_border"):
		OS.window_borderless = !OS.window_borderless
	position += Vector2(hsp*hdir,vsp*vdir)*delta
	if position.x - 249 <= 0 :
		$ProductiveSound.play()
		hdir = 1
		hsp = rand_range(100,300)
	if (position.x -249 +viewport_size.x) >= screen_size.x:
		$ProductiveSound.play()
		hdir = -1
		hsp = rand_range(100,300)
	if position.y -249 <= 0:
		$ProductiveSound.play()
		vdir = 1
		vsp = rand_range(100,300)
	if (position.y -249+viewport_size.y) >= screen_size.y:
		$ProductiveSound.play()
		vdir = -1
		vsp = rand_range(100,300)

func no_more_productive() -> void:
	get_tree().quit()

func _on_TrashTimer_timeout() -> void:
	var new_trash = trash.instance()
	new_trash.position = position
	$"..".add_child(new_trash)

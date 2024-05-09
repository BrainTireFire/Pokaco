extends "res://scripts/character.gd"

@onready var sword: Node2D = $Sword
@onready var sword_animation_player: AnimationPlayer = sword.get_node("SwordAnimationPlayer")
@onready var slash_sprite = $Sword/SlashSprite


func _process(_delta: float) -> void:
	var mouse_direction: Vector2 = (get_global_mouse_position() - global_position).normalized()
	
	if mouse_direction.x > 0 and animated_sprite.flip_h:
		animated_sprite.flip_h = false
	elif mouse_direction.x < 0 and not animated_sprite.flip_h:
		animated_sprite.flip_h = true
		
	# this is move the sword whe moving mouse 
	# and rotating sword left to right
	sword.rotation = mouse_direction.angle()
	if sword.scale.y == 1 and mouse_direction.x < 0:
		sword.scale.y = -1
	elif sword.scale.y == -1 and mouse_direction.x > 0:
		sword.scale.y = 1
	if Input.is_action_just_pressed("ui_attack") and not sword_animation_player.is_playing():
		sword_animation_player.play("attack")

func get_input() -> void:
	movement_direction = Vector2.ZERO
	if Input.is_action_pressed("ui_down"):
		movement_direction += Vector2.DOWN
	if Input.is_action_pressed("ui_left"):
		movement_direction += Vector2.LEFT
	if Input.is_action_pressed("ui_right"):
		movement_direction += Vector2.RIGHT
	if Input.is_action_pressed("ui_up"):
		movement_direction += Vector2.UP

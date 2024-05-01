extends CharacterBody2D
class_name Character

const friction_with_floor = 0.15

@export var accerelation: int = 40
@export var max_speed: int = 100

@onready var animated_sprite = $AnimatedSprite2D

var movement_direction : Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	move_and_slide()
	velocity = lerp(velocity, Vector2.ZERO, friction_with_floor)

func move() -> void:
		movement_direction = movement_direction.normalized()
		velocity += movement_direction * accerelation

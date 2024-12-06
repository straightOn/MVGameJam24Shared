extends GameObject

class_name Player

const SPEED: float = 300

func _physics_process(delta):
	move_and_slide()

func move_action(direction: Vector2):
	velocity = direction * SPEED

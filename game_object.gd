extends CharacterBody2D

class_name GameObject

var id: int = 0
var last_sent_position: Vector2 = Vector2.ZERO
signal position_changed_event(id: int, position: Vector2)

func _process(delta):
	move_and_slide()
	if (position != last_sent_position):
		last_sent_position = position
		position_changed_event.emit(id, position)

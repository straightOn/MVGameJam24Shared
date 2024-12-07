class_name GameObject extends CharacterBody2D

const ObjectTypeResource = preload("res://shared/object_type.gd")
const GamePhaseResource = preload("res://shared/game_phase.gd")

var id: int = 0
@export var label: String
@export var type: ObjectTypeResource.ObjectType
@export var phase: GamePhaseResource.Phase

func get_phase() -> GamePhaseResource.Phase:
	return phase

func get_type() -> ObjectTypeResource.ObjectType:
	return type

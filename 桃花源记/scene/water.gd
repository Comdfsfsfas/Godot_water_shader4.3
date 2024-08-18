extends Node3D

@onready var ball: Node3D = $ball

func _ready() -> void:
	ball.get_node('AnimationPlayer').play('move')

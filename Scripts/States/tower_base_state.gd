class_name TowerBaseState extends RefCounted

var tower: Tower

func _init(t: Tower) -> void:
	tower = t

func enter() -> void:
	pass

func exit() -> void:
	pass

func tick(_delta: float) -> void:
	pass

func branch() -> TowerBaseState:
	return null

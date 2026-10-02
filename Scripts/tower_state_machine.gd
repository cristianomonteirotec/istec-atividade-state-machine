class_name TowerStateMachine extends RefCounted

var current_state: TowerBaseState

func change(new_state: TowerBaseState) -> void:
	if current_state != null:
		current_state.exit()
	current_state = new_state
	current_state.enter()

func _init(t: Tower) -> void:
	change(TowerEmptyState.new(t))

func tick(delta: float) -> void:
	current_state.tick(delta)
	check_conditions()

func check_conditions() -> void:
	var new_state: TowerBaseState = current_state.branch()
	if new_state != null:
		change(new_state)

class_name TowerEmptyState extends TowerBaseState

func enter() -> void:
	tower.state_label.text = "State: Empty"

func branch() -> TowerBaseState:
	if tower.resources > 0.0:
		return TowerConsumingState.new(tower)
	return null

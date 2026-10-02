class_name TowerGatheringState extends TowerBaseState

func enter() -> void:
	tower.state_label.text = "State: Gathering"
	tower.gathering_timer.start()

func branch() -> TowerBaseState:
	if not tower.gathering_timer.is_stopped():
		return null
	if tower.resources > 0.0:
		return TowerConsumingState.new(tower)
	return TowerEmptyState.new(tower)

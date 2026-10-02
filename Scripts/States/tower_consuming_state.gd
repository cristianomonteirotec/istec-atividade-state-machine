class_name TowerConsumingState extends TowerBaseState

func enter() -> void:
	tower.state_label.text = "State: Consuming"

func tick(delta: float) -> void:
	var amount_to_spend: float = tower.consumption_rate * delta
	tower.resources = maxf(0.0, tower.resources - amount_to_spend)
	tower.update_resource_label()

func branch() -> TowerBaseState:
	if tower.resources <= 0.0:
		return TowerEmptyState.new(tower)
	return null

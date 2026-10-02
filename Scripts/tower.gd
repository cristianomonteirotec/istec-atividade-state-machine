class_name Tower extends Node2D

var resources: float = 0.0
var state_machine: TowerStateMachine

@export var resources_per_click: float = 10.0
@export var consumption_rate: float = 2.0

@onready var resource_label: Label = $ResourceLabel
@onready var state_label: Label = $StateLabel
@onready var gathering_timer: Timer = $GatheringTimer

func update_resource_label() -> void:
	resource_label.text = "Resources: " + str(resources)

func _ready() -> void:
	update_resource_label()
	state_machine = TowerStateMachine.new(self)

func gather_resources() -> void:
	resources += resources_per_click
	update_resource_label()
	state_machine.change(TowerGatheringState.new(self))

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			gather_resources()

func _process(delta: float) -> void:
	state_machine.tick(delta)

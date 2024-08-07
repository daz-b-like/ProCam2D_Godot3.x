tool
extends Node2D

# Enums
enum ProcessMode {
	IDLE,
	PHYSICS,
	OFF
}
var process_mode: int = ProcessMode.OFF setget set_tha_process_mode
export var enabled: bool = true setget set_enabled
export var priority: int = 0 setget set_priority
var debug_draw: bool = false
var debug_color := [ Color("#563AFB"), Color("#7a90d8"), Color.yellow]
var _pm : int = 1
var debug_draw_scaler: float
# Signals

signal debug_draw_changed(node)
signal priority_changed(node)
signal position_changed(node)
signal tree_left(node)

func _ready() -> void:
	z_index = VisualServer.CANVAS_ITEM_Z_MAX-1
	debug_draw_scaler = get_viewport_rect().size.y/600
	setup_signals()
	_update_process_mode()

func _process(delta):
	if enabled and process_mode == ProcessMode.IDLE:
		_update(delta)
		update()

func _physics_process(delta):
	if enabled and process_mode == ProcessMode.PHYSICS:
		_update(delta)
		update()

func setup_signals():
	connect("tree_exiting", self, "on_tree_exited")

func set_priority(value: int):
	if priority != value:
		priority = value
		emit_signal("priority_changed", value)

func set_enabled(value):
	enabled = value
	update()
	update_configuration_warning()

func _update(_delta: float) -> void:
	# Virtual method to be overridden by child classes
	pass

func change_debug(camera):
	debug_draw = camera.debug_draw
	update()

func set_tha_process_mode(value):
	if process_mode != value:
		_pm = value
		process_mode = value
		_update_process_mode()

func _update_process_mode() -> void:
	set_process(process_mode == ProcessMode.IDLE)
	set_physics_process(process_mode == ProcessMode.PHYSICS)

func _draw() -> void:
	if not enabled:
		return
	if debug_draw or Engine.is_editor_hint():
		_draw_debug()

func _draw_debug() -> void:
	# Virtual method to be overridden by child classes for debug drawing
	pass

func on_tree_exited():
	emit_signal("tree_left", self)

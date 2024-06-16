extends Node

enum {
	 PHYSICS_PROCESS,
	 IDLE_PROCESS
}

enum {
	 SCREEN_SHAKE_HORIZONTAL,
	 SCREEN_SHAKE_VERTICAL,
	 SCREEN_SHAKE_PERLIN,
	 SCREEN_SHAKE_RANDOM,
	 SCREEN_SHAKE_ZOOM,
	 SCREEN_SHAKE_ROTATE,
	 SCREEN_SHAKE_CIRCULAR
}

enum {
	 DRAG_TYPE_PRED,
	 DRAG_TYPE_SPRING_DAMP,
	 DRAG_TYPE_ADAPTIVE,
	 DRAG_TYPE_SMOOTH_DAMP
}

var current_position: Vector2 setget set_cur_pos, get_cur_pos
var current_rotation: float setget set_cur_rot, get_cur_rot
var track_multiple_objects: bool setget set_tmo, get_tmo
var target: Object setget set_target, get_target
var target_radius: float setget set_tr,get_tr
var offset: Vector2 setget set_offset, get_offset
var process_type: int setget set_pm, get_pm
var offset_smoothly: bool setget set_os, get_os
var offset_speed: float setget set_ospd, get_ospd
var drag_smoothly: bool setget set_ds, get_ds
var drag_speed: Vector2 setget set_dspd, get_dspd
var drag_type: int setget set_dt, get_dt
var rotate: bool setget set_r, get_r
var rotation_speed: float setget set_rspd, get_rspd
var rotate_smoothly: bool setget set_rs, get_rs
var zoom_level: float setget set_zoom_level, get_zoom_level
var zoom_smoothly: bool setget set_zs, get_zs
var zoom_speed: float setget set_zspd, get_zspd
var limit_smoothly: bool setget set_ls, get_ls
var left_limit: float setget set_ll, get_ll
var right_limit: float setget set_rl, get_rl
var top_limit: float setget set_tl, get_tl
var bottom_limit: float setget set_bl, get_bl
var enable_v_margins: bool setget set_vm, get_vm
var enable_h_margins: bool setget set_hm, get_hm
var drag_margin_left: float setget set_lm, get_lm
var drag_margin_right: float setget set_rm, get_rm
var drag_margin_top: float setget set_tm, get_tm
var drag_margin_bottom: float setget set_bm, get_bm
var screen_center: Vector2 setget set_sc, get_sc
var ACTIVE_PROCAM: Node

func _ready() -> void:
	 if get_tree().has_group("procam"):
		  ACTIVE_PROCAM = get_tree().get_nodes_in_group("procam")[0]

# Helper functions
func _ensure_active_procam() -> bool:
	 return ACTIVE_PROCAM != null

func _set_active_procam_value(property: String, value):
	 if _ensure_active_procam():
		  ACTIVE_PROCAM.set(property, value)

func _get_active_procam_value(property: String):
	 if _ensure_active_procam():
		  return ACTIVE_PROCAM.get(property)
	 return null

# Public functions
func start_shake(types: = [SCREEN_SHAKE_PERLIN], duration: float = 0.3, magnitude: float = 3.5, speed: float = 20.0) -> void:
	 if _ensure_active_procam():
		  ACTIVE_PROCAM._start_shake(types, duration, magnitude, speed)

# Property setters and getters
func set_target(value: Node2D):
	 if _ensure_active_procam():
		  ACTIVE_PROCAM._change_target_to(value)

func get_target():
	 return _get_active_procam_value("_target")

func set_cur_pos(value: Vector2):
	 _set_active_procam_value("_cur_pos", value)

func get_cur_pos():
	 return _get_active_procam_value("_cur_pos")

func set_cur_rot(value):
	 _set_active_procam_value("_cur_rot", float(value))

func get_cur_rot():
	 return _get_active_procam_value("_cur_rot")

func set_zoom_level(value):
	 _set_active_procam_value("_zoom_level", float(value))

func get_zoom_level():
	 return _get_active_procam_value("_cur_zoom")

func set_tmo(value: bool):
	 _set_active_procam_value("_tracking_multiple_objects", value)

func get_tmo():
	 return _get_active_procam_value("_tracking_multiple_objects")

func set_offset(value: Vector2):
	 _set_active_procam_value("_offset", value)

func get_offset():
	 return _get_active_procam_value("_offset")

func set_pm(value: int):
	 _set_active_procam_value("_process_mode", wrapi(value, 0, 2))

func get_pm():
	 return _get_active_procam_value("_process_mode")

func set_os(value: bool):
	 _set_active_procam_value("_offset_smoothly", value)

func get_os():
	 return _get_active_procam_value("_offset_smoothly")

func set_ospd(value):
	 _set_active_procam_value("_offset_speed", float(value))

func get_ospd():
	 return _get_active_procam_value("_offset_speed")

func set_ds(value: bool):
	 _set_active_procam_value("_drag_smoothly", value)

func get_ds():
	 return _get_active_procam_value("_drag_smoothly")

func set_dspd(value: Vector2):
	 _set_active_procam_value("_drag_speed", value)

func get_dspd():
	 return _get_active_procam_value("_drag_speed")

func set_dt(value: int):
	 _set_active_procam_value("_drag_type", wrapi(value, 0, 4))

func get_dt():
	 return _get_active_procam_value("_drag_type")

func set_r(value: bool):
	 _set_active_procam_value("_rotate", value)

func get_r():
	 return _get_active_procam_value("_rotate")

func set_rspd(value):
	 _set_active_procam_value("_rotation_speed", float(value))

func get_rspd():
	 return _get_active_procam_value("_rotation_speed")

func set_rs(value: bool):
	 _set_active_procam_value("_rotate_smoothly", value)

func get_rs():
	 return _get_active_procam_value("_rotate_smoothly")

func set_zs(value: bool):
	 _set_active_procam_value("_zoom_smoothly", value)

func get_zs():
	 return _get_active_procam_value("_zoom_smoothly")

func set_zspd(value):
	 _set_active_procam_value("_zoom_speed", float(value))

func get_zspd():
	 return _get_active_procam_value("_zoom_speed")

func set_ls(value: bool):
	 _set_active_procam_value("_limit_smoothly", value)

func get_ls():
	 return _get_active_procam_value("_limit_smoothly")

func set_ll(value):
	 _set_active_procam_value("_left_limit", float(value))

func get_ll():
	 return _get_active_procam_value("_left_limit")

func set_rl(value):
	 _set_active_procam_value("_right_limit", float(value))

func get_rl():
	 return _get_active_procam_value("_right_limit")

func set_tl(value):
	 _set_active_procam_value("_top_limit", float(value))

func get_tl():
	 return _get_active_procam_value("_top_limit")

func set_bl(value):
	 _set_active_procam_value("_bottom_limit", float(value))

func get_bl():
	 return _get_active_procam_value("_bottom_limit")

func set_lm(value):
	 _set_active_procam_value("_drag_margin_left", float(value))

func get_lm():
	 return _get_active_procam_value("_drag_margin_left")

func set_rm(value):
	 _set_active_procam_value("_drag_margin_right", float(value))

func get_rm():
	 return _get_active_procam_value("_drag_margin_right")

func set_tm(value):
	 _set_active_procam_value("_drag_margin_top", float(value))

func get_tm():
	 return _get_active_procam_value("_drag_margin_top")

func set_bm(value):
	 _set_active_procam_value("_drag_margin_bottom", float(value))

func get_bm():
	 return _get_active_procam_value("_drag_margin_bottom")

func set_vm(value: bool):
	 _set_active_procam_value("_enable_v_margins", value)

func get_vm():
	 return _get_active_procam_value("_enable_v_margins")

func set_hm(value: bool):
	 _set_active_procam_value("_enable_h_margins", value)

func get_hm():
	 return _get_active_procam_value("_enable_h_margins")

func set_tr(value: float):
	 _set_active_procam_value("_target_radius", value)

func get_tr():
	 return _get_active_procam_value("_target_radius")

func set_sc(_value):
	 if _ensure_active_procam():
		  printerr("You can't directly change the screen center. Use current_position")

func get_sc():
	 return _get_active_procam_value("_screen_center")

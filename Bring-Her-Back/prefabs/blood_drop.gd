extends Node2D


var local_pos
var start_time


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Local position (relative to its parent node)
	local_pos = get_node("BloodDrop").position.y
	start_time = Time.get_ticks_msec()
	#print("Local Position: ", local_pos)
	#pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	local_pos = get_node("BloodDrop").position.y
	if local_pos < -10:
		var elapsed_time = Time.get_ticks_msec() - start_time
		#print("Time elapsed: ", elapsed_time, " ms")
		queue_free()

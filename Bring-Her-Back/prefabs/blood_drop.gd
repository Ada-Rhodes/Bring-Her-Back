extends Node2D


var local_pos


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Local position (relative to its parent node)
	local_pos = get_node("BloodDrop").position.y
	#print("Local Position: ", local_pos)
	#pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	local_pos = get_node("BloodDrop").position.y
	if local_pos < 0:
		queue_free()

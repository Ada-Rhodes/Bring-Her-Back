extends Node2D


var local_pos
var start_time
@onready var sprite: AnimatedSprite2D = $BloodDrop/AnimatedSprite2D
var caught: bool


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	caught = false # set as not caught
	sprite.play("default")
	# Local position (relative to its parent node)
	local_pos = get_node("BloodDrop").position.y
	start_time = Time.get_ticks_msec()
	#print("Local Position: ", local_pos)
	#pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	local_pos = get_node("BloodDrop").position.y
	# impact frame 
	if local_pos < 10:
		sprite.play("impact")
	if local_pos < -5:
		sprite.play("default")
		sprite.modulate.a = 0.5
	# delete if off screen 
	if local_pos < -64:
		var elapsed_time = Time.get_ticks_msec() - start_time
		#print("Debug: blood_drop: Time elapsed: ", elapsed_time, " ms")
		
		queue_free()

func poof() -> void:
	print("poof")

func on_beat(state: int) -> bool:
	if state == 1:
		caught = true
	if state ==0:
		caught = false 
	if state == 2:
		#return without updating
		print("Debug 1: blood_drop: ", caught)
	return caught

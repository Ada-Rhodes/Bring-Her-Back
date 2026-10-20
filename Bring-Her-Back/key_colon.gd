extends Sprite2D


# Pre-Load Blood Drop Instance
const BLOOD_DROP = preload("res://prefabs/blood_drop.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var aPressed = Input.is_action_just_pressed("Key Colon")
	if aPressed == true:
		$AudioStreamPlayer.play()
		#print('Button pressed')
		spawn_blood()
		
# Spawn Blood drop in desired position 
func spawn_blood() -> void:
	# Create an instance of the blood drop 
	var blood_instance = BLOOD_DROP.instantiate()
	
	# Set blood drop position 1-8 
	# Do this later
	
	# Add blood drop to paret scene as a child 
	add_child(blood_instance)

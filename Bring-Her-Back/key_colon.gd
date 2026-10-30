extends Sprite2D


# Pre-Load Blood Drop Instance
const BLOOD_DROP = preload("res://prefabs/blood_drop.tscn")
signal missed_beat


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"Target Drop".visible=false



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var aPressed = Input.is_action_just_pressed("Key Colon")
	if aPressed == true:
		$AudioStreamPlayer.play()
		#spawn_blood() #moved to the game loop
		
# Spawn Blood drop in desired position 
func spawn_blood() -> void:
	# Create an instance of the blood drop 
	var blood_instance = BLOOD_DROP.instantiate()
	
	# create exited signal 
	blood_instance.tree_exited.connect(_on_blood_instance_left_tree)
	
	# Add blood drop to paret scene as a child 
	add_child(blood_instance)


func _on_blood_instance_left_tree() -> void:
	# on blood instance leaving the tree, emit missed_beat signal
	missed_beat.emit()
	print("donezo")



func _on_area_2d_body_entered(body: Node2D) -> void:
	$"Target Drop".modulate.a=1.0 # make visible
	$"Target Drop".visible=true
	

func _on_area_2d_body_exited(body: Node2D) -> void:
	$"Target Drop".modulate.a=0.0 # Make transparent

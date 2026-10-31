extends Sprite2D


# Pre-Load Blood Drop Instance
const BLOOD_DROP = preload("res://prefabs/blood_drop.tscn")
signal missed_beat
var caught: bool
var on_beat: bool
var droplet: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#$"Target Drop".modulate.a=0.0
	$"Target Drop".visible=false



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var aPressed = Input.is_action_just_pressed("Key L")
	if aPressed == true:
		$AudioStreamPlayer.play()
		#spawn_blood() #moved to the game loop
		if $Area2D.area_entered:
			print("A")
			if droplet!=null:
				droplet.queue_free()
			
		
# Spawn Blood drop in desired position 
func spawn_blood() -> void:
	# Create an instance of the blood drop 
	var blood_instance = BLOOD_DROP.instantiate()
	
	# create exited signal 
	blood_instance.tree_exited.connect(_on_blood_instance_left_tree)
	
	# Add blood drop to paret scene as a child 
	add_child(blood_instance)


func _on_blood_instance_left_tree() -> void:
	if is_instance_valid(droplet):
		# on blood instance leaving the tree, emit missed_beat signal
		if droplet.on_beat(2) == false:
			missed_beat.emit() # if missed drop, then signal
			print("oof")
		if droplet.on_beat(2) == true: 
			print("caught")
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	$"Target Drop".visible=true
	droplet = body.get_parent()
	on_beat = true
	droplet.on_beat(1)
	#blood.queue_free()
	
	#if blood.has_method("poof"):
	#	blood.poof()
	#	caught = true # flag to account for caught drop
	#	blood.queue_free()
	#if body.has_method()
	

func _on_area_2d_body_exited(body: Node2D) -> void:
	$"Target Drop".visible=false
	on_beat = false
	caught = false

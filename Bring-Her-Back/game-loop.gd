extends Node2D


# Pre-Load Blood Drop Instance
const BLOOD_DROP = preload("res://prefabs/blood_drop.tscn")
var col: int=9
var row: int=8
var track: Array[Array]
var metrinome
@export var life_counter: int
@onready var key_sp: Sprite2D = $"Buttons/Space - Target Ring"
@onready var key_a: Sprite2D = $"Buttons/A - Target Ring"
@onready var key_s: Sprite2D = $"Buttons/S - Target Ring"
@onready var key_d: Sprite2D = $"Buttons/D - Target Ring"
@onready var key_f: Sprite2D = $"Buttons/F - Target Ring"
@onready var key_v: Sprite2D = $"Buttons/V - Target Ring"
@onready var key_n: Sprite2D = $"Buttons/N - Target Ring"
@onready var key_j: Sprite2D = $"Buttons/J - Target Ring"
@onready var key_k: Sprite2D = $"Buttons/K - Target Ring"
@onready var key_l: Sprite2D = $"Buttons/L - Target Ring"
@onready var key_col: Sprite2D = $"Buttons/Col - Target Ring"
	#CharacterBody2D = $"../Character"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Set starting life
	life_counter = 25
	#spawn_blood()
	load_track()
	#start timer
	metrinome = Time.get_ticks_msec()
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# if there are still beats left in the track then
	if track.size()>0:
		# if one beat has passed 
		if Time.get_ticks_msec()-metrinome>250:
			#print the beat
			print(track[0])
			#I need a function to interpet the track beat and release the right drops.
			play_beat()
			#remove the beat 
			track.remove_at(0)
			#update the metrinome time 
			metrinome = Time.get_ticks_msec()
	if life_counter<=0:
		get_tree().change_scene_to_file("res://GameOver.tscn")


# Spawn Blood drop in desired position 
func spawn_blood() -> void:
	# Create an instance of the blood drop 
	var blood_instance = BLOOD_DROP.instantiate()
	
	# Add blood drop to paret scene as a child 
	add_child(blood_instance)


func play_beat() -> void:
	# load in the current beat
	var beat=track[0]
	# if heart beat, then
	if beat[0]==1:
		# find child node and release blood drop 
		$"Buttons/Space - Target Ring".spawn_blood()
	if beat[1]==1:
		# find key a child node and release blood drop
		$"Buttons/A - Target Ring".spawn_blood()
	if beat[2]==1:
		# find key a child node and release blood drop
		$"Buttons/S - Target Ring".spawn_blood()
	if beat[3]==1:
		# find key a child node and release blood drop
		$"Buttons/D - Target Ring".spawn_blood()
	if beat[4]==1:
		# find key a child node and release blood drop
		$"Buttons/F - Target Ring".spawn_blood()
	if beat[5]==1:
		# find key a child node and release blood drop
		$"Buttons/v - Target Ring".spawn_blood()
	if beat[6]==1:
		# find key a child node and release blood drop
		$"Buttons/N - Target Ring".spawn_blood()
	if beat[7]==1:
		# find key a child node and release blood drop
		$"Buttons/J - Target Ring".spawn_blood()
	if beat[8]==1:
		# find key a child node and release blood drop
		$"Buttons/K - Target Ring".spawn_blood()
	if beat[9]==1:
		# find key a child node and release blood drop
		$"Buttons/L - Target Ring".spawn_blood()
	if beat[10]==1:
		# find key a child node and release blood drop
		$"Buttons/Col - Target Ring".spawn_blood()


func load_track() -> void:
	#Create my shit
	track=[
		#waiting
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		
		# count in 
		[0,
		0,0,0,0,0,
		0,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,0,0,0,0],
		[1,
		0,0,0,0,0,
		0,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,0,0,0,0],
		[1,
		0,0,0,0,0,
		0,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,0,0,0,0],
		
		[0,
		0,0,0,0,0,
		0,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,0,0,0,0],
		[1,
		0,0,0,0,0,
		0,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,0,0,0,0],
		[1,
		0,0,0,0,0,
		0,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,0,0,0,0],
		
		# add hi hat - need to be clickier
		[0,
		1,0,0,0,0,
		0,0,0,0,0],
		[0,
		1,0,0,0,0,
		0,0,0,0,0],
		[1,
		0,0,0,0,0,
		0,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,0,0,0,0],
		[0,
		1,0,0,0,0,
		0,0,0,0,0],
		[0,
		1,0,0,0,0,
		0,0,0,0,0],
		[1,
		0,0,0,0,0,
		0,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,0,0,0,0],
		
		[0,
		1,0,0,0,0,
		0,0,0,0,0],
		[0,
		1,0,0,0,0,
		0,0,0,0,0],
		[1,
		0,0,0,0,0,
		0,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,0,0,0,0],
		[0,
		1,0,0,0,0,
		0,0,0,0,0],
		[0,
		1,0,0,0,0,
		0,0,0,0,0],
		[1,
		0,0,0,0,0,
		0,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,0,0,0,0],
		
		[1,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[1,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		
		# drums
		[1,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,1,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,0,1,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,1,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		
		[1,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,1,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,0,1,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,1,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		
		[1,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,1,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,0,1,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,1,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		
		[1,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,1,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,0,1,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,1,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		
		# Bass line
		[0,0,0,0,0,0,0,0,1,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,1,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,1,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[1,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		
		[0,0,0,0,0,0,0,0,1,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,1,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,1,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[1,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		
		[0,0,0,0,0,0,0,0,1,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,1,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,1,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[1,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		
		[0,0,0,0,0,0,0,0,1,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,1,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,1,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[1,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		
		# Base line second measure
		[0,0,0,0,0,0,0,0,0,1,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,1,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,1,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[1,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		
		[0,0,0,0,0,0,0,0,0,1,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,1,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,1,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[1,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		
		[0,0,0,0,0,0,0,0,0,1,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,1,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,1,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[1,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		
		[0,0,0,0,0,0,0,0,0,1,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,1,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,1,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[1,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		
		
		# Melody - needs work 
		# slow 
		[0,
		0,0,0,0,0,
		0,0,0,1,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,0,0,1,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,0,0,1,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[1,
		0,0,0,0,0,
		0,1,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,0,1,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,0,1,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,0,1,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[1,
		0,0,0,0,0,
		1,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,0,0,1,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,0,0,1,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,0,0,1,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[1,
		0,0,0,0,0,
		0,1,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,0,1,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,0,1,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,0,1,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[1,
		0,0,0,0,0,
		1,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		
		[0,
		0,0,0,0,0,
		0,0,0,0,1],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,0,0,0,1],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,0,0,0,1],
		[0,0,0,0,0,0,0,0,0,0,0],
		[1,
		0,0,0,0,0,
		0,0,1,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,0,0,1,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,0,0,1,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,0,0,1,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[1,
		0,0,0,0,0,
		0,1,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,1,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,1,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,1,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[1,
		0,0,0,0,0,
		0,0,0,1,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		
		[0,
		0,0,0,0,0,
		0,0,0,0,1],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0],
		
		# put in another rhythm section here, then repeat faster
		# actually, a better idea is return to heart beat and go from 2 to 4 and then 
		#do drums twice as fast
		#do rhytm twice as fast
		# do melody twice as fast
		# do heart beat, and do 8, but then slow down to four, and then slow down to 2 and then play out at two until it ends
		
		# Bass line
		[0,
		0,0,0,0,0,
		0,0,1,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,1,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,
		0,0,0,0,0,
		1,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[1,
		0,0,0,0,0,
		0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		
		[0,
		0,0,0,0,0,
		0,0,1,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,1,0,0,0],
		[0,
		0,0,0,0,0,
		1,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[1,
		0,0,0,0,0,
		0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		
		[0,
		0,0,0,0,0,
		0,0,1,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,1,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,
		0,0,0,0,0,
		1,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[1,
		0,0,0,0,0,
		0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		
		[0,
		0,0,0,0,0,
		0,0,1,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,1,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[0,
		0,0,0,0,0,
		1,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		[1,
		0,0,0,0,0,
		0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0],
		
		# Base line second measure
		[0,
		0,0,0,0,0,
		0,0,0,1,0],
		[0,
		0,0,0,0,0,
		0,1,0,0,0],
		[0,
		0,0,0,0,0,
		1,0,0,0,0],
		[1,
		0,0,0,0,0,
		0,0,0,0,0],
		
		[0,
		0,0,0,0,0,
		0,0,0,1,0],
		[0,
		0,0,0,0,0,
		0,1,0,0,0],
		[0,
		0,0,0,0,0,
		1,0,0,0,0],
		[1,
		0,0,0,0,0,
		0,0,0,0,0],
		
		[0,
		0,0,0,0,0,
		0,0,0,1,0],
		[0,
		0,0,0,0,0,
		0,1,0,0,0],
		[0,
		0,0,0,0,0,
		1,0,0,0,0],
		[1,
		0,0,0,0,0,
		0,0,0,0,0],
		
		[0,
		0,0,0,0,0,
		0,0,0,1,0],
		[0,
		0,0,0,0,0,
		0,1,0,0,0],
		[0,
		0,0,0,0,0,
		1,0,0,0,0],
		[1,
		0,0,0,0,0,
		0,0,0,0,0],
		
		# Fast 
		[0,
		0,0,0,0,0,
		0,0,0,1,0],
		[0,
		0,0,0,0,0,
		0,0,0,1,0],
		[0,
		0,0,0,0,0,
		0,0,0,1,0],
		[1,
		0,0,0,0,0,
		0,1,0,0,0],
		[0,
		0,0,0,0,0,
		0,0,1,0,0],
		[0,
		0,0,0,0,0,
		0,0,1,0,0],
		[0,
		0,0,0,0,0,
		0,0,1,0,0],
		[1,
		0,0,0,0,0,
		1,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,0,0,1,0],
		[0,
		0,0,0,0,0,
		0,0,0,1,0],
		[0,
		0,0,0,0,0,
		0,0,0,1,0],
		[1,
		0,0,0,0,0,
		0,1,0,0,0],
		[0,
		0,0,0,0,0,
		0,0,1,0,0],
		[0,
		0,0,0,0,0,
		0,0,1,0,0],
		[0,
		0,0,0,0,0,
		0,0,1,0,0],
		[1,
		0,0,0,0,0,
		1,0,0,0,0],
		
		[0,
		0,0,0,0,0,
		0,0,0,0,1],
		[0,
		0,0,0,0,0,
		0,0,0,0,1],
		[0,
		0,0,0,0,0,
		0,0,0,0,1],
		[1,
		0,0,0,0,0,
		0,0,1,0,0],
		[0,
		0,0,0,0,0,
		0,0,0,1,0],
		[0,
		0,0,0,0,0,
		0,0,0,1,0],
		[0,
		0,0,0,0,0,
		0,0,0,1,0],
		[1,
		0,0,0,0,0,
		0,1,0,0,0],
		[0,
		0,0,0,0,0,
		0,1,0,0,0],
		[0,
		0,0,0,0,0,
		0,1,0,0,0],
		[0,
		0,0,0,0,0,
		0,1,0,0,0],
		[1,
		0,0,0,0,0,
		0,0,0,1,0],
		
		[0,
		0,0,0,0,0,
		0,0,0,0,1],
		[0,
		0,0,0,0,0,
		0,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,0,0,0,0],
		[0,
		0,0,0,0,0,
		0,0,0,0,0],
	]
	print(track.size())


func _on_space__target_ring_missed_beat() -> void:
	life_counter=life_counter-1
	print(life_counter)

func _on_a__target_ring_missed_beat() -> void:
	life_counter=life_counter-1
	print(life_counter)

func _on_s__target_ring_missed_beat() -> void:
	life_counter=life_counter-1
	print(life_counter)
	
func _on_d__target_ring_missed_beat() -> void:
	life_counter=life_counter-1
	print(life_counter)

func _on_f__target_ring_missed_beat() -> void:
	life_counter=life_counter-1
	print(life_counter)

func _on_v__target_ring_missed_beat() -> void:
	life_counter=life_counter-1
	print(life_counter)

func _on_n__target_ring_missed_beat() -> void:
	life_counter=life_counter-1
	print(life_counter)

func _on_j__target_ring_missed_beat() -> void:
	life_counter=life_counter-1
	print(life_counter)

func _on_k__target_ring_missed_beat() -> void:
	life_counter=life_counter-1
	print(life_counter)

func _on_l__target_ring_missed_beat() -> void:
	life_counter=life_counter-1
	print(life_counter)
	
func _on_col__target_ring_missed_beat() -> void:
	life_counter=life_counter-1
	print(life_counter)

extends Node3D


@onready var player = $player
@onready var start_pos = player.position
@onready var platform1 = $Platform
@onready var platform2 = $Platform2
@onready var platform3 = $Platform3
@onready var platform4 = $Platform4
@onready var bgmusic = $backgroundMusic
@onready var levelup = $levelUp
var time = 10
var enter_velocity = 5
var respawn_height = -100
var level_change_height = 200
var finished = false
var state = [0,0,0]


# Called when the node enters the scene tree for the first time.
func _ready():
	bgmusic.play()
	platform1.position.y=-10
	platform2.position.y=-10
	platform3.position.y=-10
	if platform4:
		platform4.position.y=-10
	player.velocity.y = Global.playerVelocity

# Called very frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if finished and player.position.y <= respawn_height:
		Global.level += 1
		change_scene("level%d" % Global.level)
	elif not finished and player.position.y <= respawn_height:
		player.set_position(start_pos)

# Function to update player height
func updatePlayerHeight():
	if finished and player.position.y >= level_change_height:
		change_scene("level2")

# Function called when player reaches target height
func change_scene(scene_name):
	Global.playerRotation = Vector2(player.camera.rotation.x, player.camera.rotation.y)
	Global.playerVelocity = player.velocity.y
	get_tree().change_scene_to_file("res://Levels/%s.tscn" % scene_name)
	#bgmusic

func _on_finish_body_entered(body):
	if body == player:
		levelup.play()
		finished = true
	


func _on_start_button_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	print("Hello Yabba") 
	change_scene("level1")
	
		
func _on_button_body_entered(body):
	if body == player:
		platform1.position.y=0.5

func _on_button_body_exited(body):
	if body == player:
		await get_tree().create_timer(time).timeout
		platform1.position.y=-10

func _on_button_2_body_entered(body):
	if body == player:
		platform2.position.y=0.5

func _on_button_2_body_exited(body):
	if body == player:
		await get_tree().create_timer(time).timeout
		platform2.position.y=-10

func _on_button_3_body_entered(body):
	if body == player:
		platform3.position.y=0.5 # Replace 

func _on_button_3_body_exited(body):
	if body == player:
		await get_tree().create_timer(time).timeout
		platform3.position.y=-10

func _on_button_4_body_entered(body):
	if body == player:
		platform4.position.y=0.5 # Replace 

func _on_button_4_body_exited(body):
	if body == player:
		await get_tree().create_timer(time).timeout
		platform4.position.y=-10

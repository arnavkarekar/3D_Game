extends Node3D


@onready var player = $player
@onready var start_pos = player.position
@onready var button1 = get_node("button")
@onready var gridmap = get_node("GridMap")

var enter_velocity = 5
var respawn_height = -100
var level_change_height = 200
var finished = false
var state = [0,0,0]


# Called when the node enters the scene tree for the first time.
func _ready():
	player.velocity.y = Global.playerVelocity
	for button in buttons:
		button.body_entered.connect(button_entered)
		print(button.name)

# Called very frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	updatePlayerHeight()
	if finished and player.position.y <= respawn_height:
		Global.level += 1
		change_scene("level%d" % Global.level)
	elif not finished and player.position.y <= respawn_height:
		player.set_position(start_pos)

# Function to update player height
func updatePlayerHeight():
	if finished and player.position.y >= level_change_height:
		change_scene()

# Function called when player reaches target height
func change_scene(scene_name):
	Global.playerRotation = Vector2(player.camera.rotation.x, player.camera.rotation.y)
	Global.playerVelocity = player.velocity.y
	get_tree().change_scene_to_file("res://Levels/%s.tscn" % scene_name)

func _on_finish_body_entered(body):
	if body == player:
		finished = true
		player.velocity.y = 100

func _on_button_body_entered(body):
	if body != gridmap:
		state[0]=1
func _on_button_body_exited(body):
	state[0]=0

func _on_button_2_body_entered(body):
	if body != gridmap:
		state[1]=1
func _on_button_2_body_exited(body):
	state[1]=0

func _on_button_3_body_entered(body):
	if body != gridmap:
		state[2]=1
func _on_button_3_body_exited(body):
	state[2]=0

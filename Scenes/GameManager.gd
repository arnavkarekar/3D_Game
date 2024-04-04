extends Node3D


@onready var player = $player
@onready var button1 = get_node("button")
@onready var gridmap = get_node("GridMap")

var level_change_height = 200
var finished = false
var state = [0,0,0]




## Called when the node enters the scene tree for the first time.
#func _ready():
	#player.velocity.y = -50
	#for button in buttons:
		#button.body_entered.connect(button_entered)
		#print(button.name)

# Called very frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(state)
	updatePlayerHeight()

# Function to update player height
func updatePlayerHeight():
	if finished and player.position.y >= level_change_height:
		change_scene()

# Function called when player reaches target height
func change_scene():
	Global.playerRotation = Vector2(player.camera.rotation.x, player.camera.rotation.y)
	get_tree().change_scene_to_file("res://Scenes/level2.tscn")

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

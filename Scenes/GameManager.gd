extends Node3D

@onready var buttons = get_tree().get_nodes_in_group("Button")
@onready var player = $player
@onready var start_pos = player.position

var enter_velocity = 5
var respawn_height = -100
var finished = false

func button_entered(body):
	if body == player:
		print("Button Pressed")

# Called when the node enters the scene tree for the first time.
func _ready():
	player.velocity.y = Global.playerVelocity
	for button in buttons:
		button.body_entered.connect(button_entered)
		print(button.name)

# Called very frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if finished and player.position.y <= respawn_height:
		Global.level += 1
		change_scene("level%d" % Global.level)
	elif not finished and player.position.y <= respawn_height:
		player.set_position(start_pos)

# Function called when player reaches target height
func change_scene(scene_name):
	Global.playerRotation = Vector2(player.camera.rotation.x, player.camera.rotation.y)
	Global.playerVelocity = player.velocity.y
	get_tree().change_scene_to_file("res://Levels/%s.tscn" % scene_name)

func _on_finish_body_entered(body):
	if body == player:
		finished = true

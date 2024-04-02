extends Node3D

@onready var buttons = get_tree().get_nodes_in_group("Button")
@onready var player = $player

var level_change_height = 200

var finished = false

func button_entered(body):
	if body == player:
		print("Button Pressed")

# Called when the node enters the scene tree for the first time.
func _ready():
	player.velocity.y = -50
	for button in buttons:
		button.body_entered.connect(button_entered)
		print(button.name)

# Called very frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
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

extends Node3D

@onready var buttons = get_tree().get_nodes_in_group("Button")
@onready var player = $player

func button_entered(body):
	if body == player:
		print("Button Pressed")

# Called when the node enters the scene tree for the first time.
func _ready():
	for button in buttons:
		button.body_entered.connect(button_entered)
		print(button.name)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

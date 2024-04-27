extends Area3D

@onready var green = $Green
@onready var red = $Red
@onready var button = $buttonClick
var time = 7

func _ready():
	pass

func _process(delta):
	pass

func click():
	green.visible = not green.visible
	red.visible = not green.visible

func _on_body_entered(body):
	if body.name == "player":
		button.play()
		red.visible = true
		green.visible = false

func _on_body_exited(body):
	if body.name == "player":
		await get_tree().create_timer(time).timeout
		red.visible = false
		green.visible = true

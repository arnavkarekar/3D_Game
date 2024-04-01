extends Area3D

@onready var green = $Green
@onready var red = $Red

func _ready():
	pass

func _process(delta):
	pass

func click():
	green.visible = not green.visible
	red.visible = not green.visible

func _on_body_entered(body):
	if body.name == "player":
		click()

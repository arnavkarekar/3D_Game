extends RigidBody3D

var speed = 5.0

func _physics_process(delta):
	linear_velocity.y = speed
	

extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var ball = preload("res://Ball.tscn")
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	for n in 50:
		rng.randomize()
		var instance = ball.instance()
		
		instance.position=Vector2(rng.randf_range(0,1200),rng.randf_range(0,650))
		add_child(instance)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	pass # Replace with function body.
func _draw():
	draw_circle(position,rng.randf_range(10.0, 50.0),Color(rng.randf(),rng.randf(),rng.randf()))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var z = 0

var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	z = rng.randf_range(0,200)
	pass # Replace with function body.

	
func _draw():
	var radius = rng.randf_range(10.0, 50.0)
	var drawPositionTable = WorldToScreen.wp_to_sp(position,z)
	var drawPosition = drawPositionTable[0]
	print(drawPosition)
	#var shadowPositionTable = WorldToScreen.wp_to_sp(position,0)
	var shadowPosition = Vector2(drawPositionTable[0].x,drawPositionTable[0].y+z)
	draw_circle(shadowPosition,radius,Color.dimgray)
	draw_circle(drawPosition,radius,Color(rng.randf(),rng.randf(),rng.randf()))
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

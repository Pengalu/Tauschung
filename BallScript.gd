extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var z = 0
var shadow = preload("res://Shadow.tscn")
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
	
	#var shadowPositionTable = WorldToScreen.wp_to_sp(position,0)
	var shadowPosition = Vector2(drawPositionTable[0].x,drawPositionTable[0].y+z)
	
	var shadowInstance = shadow.instance()
	shadowInstance.position = shadowPosition
	#add_child(get_node("/root/Node2D/"))
	add_child(shadowInstance)
	#get_node("..").add_child(shadowInstance)
	
	#shadowInstance.draw_func(shadowPosition,radius,Color.dimgray)
	#shadowInstance.pos = shadowPosition
#	shadowInstance.radius = radius
#	shadowInstance.color = Color.dimgray
	position = drawPosition
	var realRadius = radius/32
	$Sprite.scale=Vector2(realRadius,realRadius)
	$Sprite.modulate = Color(rng.randf(),rng.randf(),rng.randf())
	shadowInstance.get_child(0).scale = Vector2(realRadius,realRadius)
	#draw_circle(drawPosition,radius,Color(rng.randf(),rng.randf(),rng.randf()))
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

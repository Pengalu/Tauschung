extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var z = 0
var shadow = preload("res://Shadow.tscn")
var shadowInstance=null
var rng = RandomNumberGenerator.new()
var radius=0
var drawPosition = null
var drawPositionTable = null
var originalPosition = null
# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	z = rng.randf_range(2,120)
	pass # Replace with function body.

	
func _draw():
	if radius == 0:
		radius = rng.randf_range(25.0, 100.0)
		$Sprite.modulate = Color(rng.randf(),rng.randf(),rng.randf())
		originalPosition = position
	#print(position)
	drawPositionTable = WorldToScreen.wp_to_sp(originalPosition,z)
	drawPosition = drawPositionTable[0]
	
	#var shadowPositionTable = WorldToScreen.wp_to_sp(position,0)
	var shadowPositionTable = WorldToScreen.wp_to_sp(originalPosition,0)
	if shadowInstance == null:
		shadowInstance = shadow.instance()
		get_node("/root/Node2D/").add_child(shadowInstance)
	
	#add_child(get_node("/root/Node2D/"))
	#add_child(shadowInstance)
	
	#get_node("..").add_child(shadowInstance)
	
	#shadowInstance.draw_func(shadowPosition,radius,Color.dimgray)
	#shadowInstance.pos = shadowPosition
#	shadowInstance.radius = radius
#	shadowInstance.color = Color.dimgray
	position = drawPosition
	#print(position)
	var realRadius = radius/32
	$Sprite.scale=Vector2(realRadius,realRadius)
	
	shadowInstance.scale = Vector2(realRadius,realRadius)
	z_index = position.y
	shadowInstance.z_index = -4095#max is -4096
	shadowInstance.position = Vector2(shadowPositionTable[0].x,shadowPositionTable[0].y+z)
	
	#draw_circle(drawPosition,radius,Color(rng.randf(),rng.randf(),rng.randf()))
func _process(delta):
	update()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

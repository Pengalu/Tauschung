extends Node2D



#Custom freakin rotation system!
var z = 0
var angle = 0 #IN DEGREES
var m00 = 0
var m01 = 0
var m10 = 0
var m11 = 0
var size = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
	print(lendir_port(Vector2(500,500),45,1))
	 # Replace with function body.
func _draw():
	size= get_viewport().get_size()
func lendir_port(start,dir,mag):
	var radians = dir*(PI/180)
	var directionVector = Vector2(cos(radians),sin(radians))
	#print(directionVector)
	directionVector *=mag
	var result = directionVector
	
	return result
# Called every frame. 'delta' is the elapsed time since the previous frame.

	
func _process(delta):
	if Input.is_action_pressed("rotateLeft"):
		angle-=1
	elif Input.is_action_pressed("rotateRight"):
		angle+=1
	
	if angle ==360 or angle == -360:
		angle = 0
	m00 = lendir_port(position,angle,1).x
	m10 = lendir_port(position,angle,-1).y
	m01 = lendir_port(position,angle,1).y
	m11 = lendir_port(position,angle,1).x

	pass

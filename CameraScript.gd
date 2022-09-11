extends Node2D



#Custom freakin rotation system!
var camera = null
var z = 50
var angle = 0 #IN DEGREES
var pitch = -0;
var m00 = 0
var m01 = 0
var m10 = 0
var m11 = 0
var yscale = 0;
var zscale = 0
var size = Vector2()
var uiLabel = null
# Called when the node enters the scene tree for the first time.
func _ready():
	camera = get_node("/root/Node2D/Camera2D")
	uiLabel = get_node("/root/Node2D/Camera2D/Control/RichTextLabel")
	print(lendir_port(Vector2(500,500),45,1))
	 # Replace with function body.
func _draw():
	size= get_viewport().get_size()
	
#Equivalent to the lendir_x/_y functions in GML but takes vectors instead. The "start" vector does nothing by the way, but it makes more sense in my head, so cry harder.
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
	if Input.is_action_pressed("rotateUp"):
		pitch-=1
	elif Input.is_action_pressed("rotateDown"):
		pitch+=1
	m00 = lendir_port(position,angle,1).x
	m10 = lendir_port(position,angle,-1).y
	m01 = lendir_port(position,angle,1).y
	m11 = lendir_port(position,angle,1).x
	var scaleVector = lendir_port(position,pitch,1)
	yscale = scaleVector.y
	zscale=scaleVector.x
	#yscale = lendir_port()
	
	var rawAxisX = 0
	var rawAxisY = 0
	if Input.is_action_pressed("move_left"):
		rawAxisX-=1
	if Input.is_action_pressed("move_right"):
		rawAxisX+=1
	if Input.is_action_pressed("move_down"):
		rawAxisY -=1
	if Input.is_action_pressed("move_up"):
		rawAxisY +=1

	var forVector = lendir_port(position,-angle+90,1) #Vector2(rawAxisX,rawAxisY)
	forVector.y = -forVector.y
	var sideVector =  lendir_port(position,-angle,1)
	sideVector.y = -sideVector.y
	uiLabel.set_text(str(forVector) + " " +str(sideVector) +" "+str(angle))
	camera.position.x += rawAxisX#(rawAxisY * forVector.x )+(rawAxisX * sideVector.x);
	camera.position.y -= rawAxisY#(rawAxisY * forVector.y) + (rawAxisX * sideVector.y);
	
	
	



	pass

extends Node2D

@export var z = 20 #dont worry about it
@export var zIndexOffset = 0
var shadow = preload("res://Shadow.tscn") #preload stuff
var shadowInstance=null
var rng = RandomNumberGenerator.new()
var radius=0
var drawPosition = null
var drawPositionTable = null
var originalPosition = null
func getCurrentCamera2D(): #Returns whatever camera is being used right now since godot cannot use its native function for this on 2d cameras.
	var viewport = get_viewport()
	if not viewport:
		return null
	var camerasGroupName = "__cameras_%d" % viewport.get_viewport_rid().get_id()
	var cameras = get_tree().get_nodes_in_group(camerasGroupName)
	for camera in cameras:
		if camera is Camera2D and camera.is_current():
			return camera
	return null
# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	#z = rng.randf_range(2,120) #set a random depth position 
	pass # Replace with function body.

	
func _draw(): #called every time the screen is rendered
	if radius == 0: #If the ball doesn't exist or is too small to render noticeably
		radius = 100.0#rng.randf_range(25.0, 100.0) #generate a ball large enough to render 
		#$Sprite2D.modulate = Color(rng.randf(),rng.randf(),rng.randf()) #random color generation
		originalPosition = position #set the origin position of the ball
		
	
	drawPositionTable = WorldToScreen.wp_to_sp(originalPosition,z) #convert ball coordinates to local axis
	drawPosition = drawPositionTable[0] #prep variables for drawing
	
	
	var shadowPositionTable = WorldToScreen.wp_to_sp(originalPosition,0)#draw the shadows at 0 depth (*ground)
	if shadowInstance == null: #generate shadow
		shadowInstance = shadow.instantiate()
		get_node("/root/Node2D/").add_child(shadowInstance)
	
	
	position = drawPosition #yeah
	
	
	var realRadius = (radius/32) #divide the radius by resolution of sprite because i hate game development
	var cam = getCurrentCamera2D() #see getCurrentCamera2D
	var cameraScript = CameraScript#memory leak moment
	
	$Sprite2D.scale=Vector2(realRadius,realRadius)
	var realRadiusShadow=(radius/32) #no way
	shadowInstance.scale = Vector2(1*realRadiusShadow,realRadiusShadow*cameraScript.yscale) #flattens the shadows to provide illusion of depth or something like that
	
	z_index = drawPositionTable[1] +zIndexOffset #set the draw order based on the distance from the camera on the z axis like in a 3d game
	shadowInstance.z_index = -4095#max is -4096, left some room for you :heart:
	shadowInstance.position = Vector2(shadowPositionTable[0].x,shadowPositionTable[0].y)#+z) #this just puts the shadow in the right spot
	shadowInstance.get_node("Sprite2D").texture = $Sprite2D.texture
	shadowInstance.get_node("Sprite2D").scale = scale
func _process(delta):
	queue_redraw()
	


extends Node
#Autoloaded script.
#Convert a position in the world space and turn it into a position on the screen (relative to the camera)
# Heavily derived from the wp_to_sp script in the source code of Sokpop Ruben's 2d to 3d example.

#TAKES
#any Vector2.
#a float for the z coordinate of the object.
#RETURNS
#Vector2 of the position local to the screen
#Float of the relative Z position (depth)
#Float "scale" of how big the object should be.


func wp_to_sp(worldPos,depth):
	#print(depth)
	var camera = CameraScript
	var res_screen_x = worldPos.x
	var res_screen_y = worldPos.y
	var res_screen_z = depth

	#res_screen_z -= camera.z;
	#OLD, DEPRECATED CODE AHEAD!
	#var res_screen_z = depth-camera.z
	#var res_screen_scale = res_screen_z/100
	#print(res_screen_scale)
	#res_screen_scale+=(1-res_screen_scale)*0.25
	#print(res_screen_scale)
	#res_screen_scale = 2/res_screen_scale
	#print(res_screen_scale)
	#res_screen_x *= res_screen_scale
	#res_screen_y *= res_screen_scale
	#END OF OLD, DEPRECATED CODE!
	
	# rotation (rotate x y)
	
	var xp_net = res_screen_x;
	#=300*1+(300*0)
	
	res_screen_x = xp_net * camera.m00 + (res_screen_y * camera.m10);
	
	
	#res_screen_y = 300*
	res_screen_y = xp_net * camera.m01 + (res_screen_y * camera.m11);
	#print(camera.m01)
	
	
	
	#res_screen_y-=depth
	var finalVector2Pos = Vector2(res_screen_x,res_screen_y)
	
	return [finalVector2Pos, res_screen_z]#1 placeholder
		

	#note: come back to this after basic depth math is done lkolollolol
	

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

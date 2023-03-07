extends Node2D
@export var point0=Vector3.ZERO;
@export var point1=Vector3.ZERO;
@export var width = 10;
@export var color =Color.BLACK;
@export var zIndexModifier=1;
# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(0,0)
	$point0.position=Vector2(point0.x,point0.y);
	$point0.z = point0.z;
	$point0.zIndexOffset = zIndexModifier;
	$point1.position=Vector2(point1.x,point1.y)
	$point1.z = point1.z;
	$point1.zIndexOffset = zIndexModifier;
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	queue_redraw()
	pass
func closest(my_vec:Vector2, my_array:Array)->int:
	var closest = 0;
	for n in range(my_array.size()):
		var vector = my_array[n]
		if(vector.distance_to(my_vec)<my_array[closest].distance_to(my_vec)):
			closest = n
	return closest
	
func _draw():
	#print($point0.position)
	
	var points = [$point0.position,$point1.position]
	var indexes = [$point0.z_index,$point1.z_index]
	z_index=indexes[0]+indexes[1]#+closest(Vector2.ZERO,points)
	
	if(name=="crossLine"):
		print(indexes.max())
		print(indexes.find(indexes.max()))
	draw_line($point0.position, $point1.position,color,width)
	

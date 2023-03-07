extends Node2D
@export var point0=Vector3.ZERO;
@export var point1=Vector3.ZERO;
@export var point2=Vector3.ZERO;
@export var point3=Vector3.ZERO;
@export var zIndexModifier=0;
@export var color =Color.BLACK;
# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(0,0)
	$point0.position=Vector2(point0.x,point0.y);
	$point0.z = point0.z;
	$point0.zIndexOffset = zIndexModifier;
	$point1.position=Vector2(point1.x,point1.y)
	$point1.z = point1.z;
	$point1.zIndexOffset = zIndexModifier;
	$point2.position=Vector2(point2.x,point2.y)
	$point2.z = point2.z;
	$point2.zIndexOffset = zIndexModifier;
	$point3.position=Vector2(point3.x,point3.y)
	$point3.z = point3.z;
	$point3.zIndexOffset = zIndexModifier;
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
	
	var points = PackedVector2Array([$point0.position,$point1.position,$point2.position,$point3.position])
	var colors = PackedColorArray([color])
	var indexes = [$point0.z_index,$point1.z_index,$point2.z_index,$point3.z_index]
	var pointsa = [$point0.position,$point1.position,$point2.position,$point3.position]
	
	#z_index=indexes.max()+closest(Vector2.ZERO,pointsa)
	z_index=indexes.max()#+zIndexModifier
	draw_polygon(points,colors)
	

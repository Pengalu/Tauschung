#extends Node2D
#
#
## Declare member variables here. Examples:
## var a = 2
## var b = "text"
#
#var ball = preload("res://Ball.tscn")
#var rng = RandomNumberGenerator.new()
#
## Called when the node enters the scene tree for the first time.
#func _ready():
#	var t = Timer.new()
#	t.set_wait_time(3)
#	t.set_one_shot(true)
#	self.add_child(t)
#	t.start()
#	yield(t, "timeout")
#	t.queue_free()
#	for n in 100:
#		rng.randomize()
#		var instance = ball.instance()
#
#		instance.position=Vector2(rng.randf_range(-1200,1200),rng.randf_range(-600,600))
#		add_child(instance)
#	pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
##func _process(delta):
##	pass

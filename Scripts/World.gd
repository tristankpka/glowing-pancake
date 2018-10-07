extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export (PackedScene) var Player
export (PackedScene) var Map

var player
var map

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	map = Map.instance()
	add_child(map)
	player = Player.instance()
	add_child(player)
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

extends Node2D


var player_in_area = false

@export var item: InvItem
var player = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and player_in_area:
		$AudioStreamPlayer.play()
		print("PLAYER PEGOU O ITEM")
		player.collect(item)
		visible = false



func _on_pickable_area_body_entered(body):
	if body.name == "Player":
		print("ENTROU")
		player = body
		player_in_area = true


func _on_pickable_area_body_exited(body):
	if body.name == "Player":
		print("SAIU")
		player = null
		player_in_area = false

extends Area2D

var cima = false
var caixa = false
var player_in_area = false
var cartão = true

@export var item: InvItem
var player = null


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and player_in_area and cima and cartão:
		print("PLAYER PEGOU O ITEM")
		player.collect(item)
		$AudioStreamPlayer.play()
		cartão = false


func _on_player_cima():
	cima = true

func _on_player_dir():
	cima = false


func _on_body_entered(body):
	if body.name == "Player":
		player = body
		player_in_area = true


func _on_body_exited(body):
	if body.name == "Player":
		player = null
		player_in_area = false

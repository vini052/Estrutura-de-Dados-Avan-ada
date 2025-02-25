extends ColorRect

@export var blackout_speed: float = 1.0
var shader_material: ShaderMaterial

func _ready():
	shader_material = material as ShaderMaterial
	shader_material.set_shader_parameter("blackout", 0.0)

func fade_to_black():
	# Faz a tela escurecer gradualmente
	var tween = get_tree().create_tween()
	tween.tween_property(shader_material, "shader_parameter/blackout", 1.0, blackout_speed)

func fade_to_normal():
	# Faz a tela voltar ao normal gradualmente
	var tween = get_tree().create_tween()
	tween.tween_property(shader_material, "shader_parameter/blackout", 0.0, blackout_speed)

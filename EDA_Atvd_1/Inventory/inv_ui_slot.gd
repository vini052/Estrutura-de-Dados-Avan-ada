extends Panel

@onready var item_visual: Sprite2D = $item_display
@onready var item_name: Label = $item_name
@onready var amount_text: Label = $amount
@onready var description: Label = $description



func update(slot: InvSlot):
	if !slot.item:
		item_visual.visible = false
		item_name.visible = false
		amount_text.visible = false
		description.visible = false
	else:
		item_visual.visible = true
		item_name.visible = true
		amount_text.visible = true
		description.visible = true
		item_visual.texture = slot.item.texture
		item_name.text = slot.item.name
		amount_text.text = str(slot.amount)
		description.text = slot.item.descr
		
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

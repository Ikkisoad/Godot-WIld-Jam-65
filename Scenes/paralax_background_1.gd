extends CanvasLayer

@onready var backbackground = $backbackground
@onready var background = $background
@onready var ground = $ground

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	ground.scroll_offset.x += -1000 * delta
	background.scroll_offset.x += -500 * delta
	backbackground.scroll_offset.x += -250 * delta

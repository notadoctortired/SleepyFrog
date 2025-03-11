extends ProgressBar

var plr = ""

func _ready():
	plr = get_parent().get_parent().get_node("Player")

func _process(delta):
	value = plr.energy

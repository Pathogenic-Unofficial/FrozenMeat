extends Control

@onready var deleteBtn: Button = $%deleteBtn

func _ready() -> void:
	deleteBtn.pressed.connect(func(): $"/root/ModLoader/FallingShrimp-FrozenMeat/MGR".removeSetting("frozenmeat"))

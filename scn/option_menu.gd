extends "res://scn/ui/options_menu.gd"

static var settingsManager = preload("res://mods-unpacked/FallingShrimp-FrozenMeat/scn/setting_manager.gd")

var buttonParent: Node
var btnTemplate: PButton

func _ready() -> void:
	btnTemplate = tab_buttons[0].duplicate()
	buttonParent = tab_buttons[0].get_parent()
	for sn in settingsManager.settings:
		addSetting(sn, settingsManager.settings[sn].instantiate())
	super._ready()

func addSetting(sn: StringName, menu: Control):
	var btn = btnTemplate.duplicate()
	btn.name = "ModTab_%s" % sn
	btn.text = sn
	tab_buttons.append(btn)
	buttonParent.add_child(btn)
	buttonParent.move_child(btn, -2)
	menu.name = "modbutton_%s" % sn
	tab_content.add_child(menu)

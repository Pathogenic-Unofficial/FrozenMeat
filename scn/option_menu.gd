extends "res://scn/ui/options_menu.gd"

static var settingsManager = preload("res://mods-unpacked/FallingShrimp-FrozenMeat/scn/setting_manager.gd")

var buttonParent: Node
var btnTemplate: PButton

func _ready() -> void:
	btnTemplate = tab_buttons[0].duplicate()
	buttonParent = tab_buttons[0].get_parent()
	settingsManager.optionMenu = self
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
func removeSetting(sn: StringName):
	var btn = get_node_or_null("ModTab_%s" % sn)
	if btn is PButton:
		tab_buttons.erase(btn)
		get_node("modbutton_%s" % sn).queue_free()
		btn.queue_free()

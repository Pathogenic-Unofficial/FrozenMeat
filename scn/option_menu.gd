extends "res://scn/ui/options_menu.gd"

static var settingsManager = preload("res://mods-unpacked/FallingShrimp-FrozenMeat/scn/setting_manager.gd")

var Constants = preload("res://mods-unpacked/FallingShrimp-FrozenMeat/constants.gd")
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
	var btn = buttonParent.get_node_or_null("ModTab_%s" % sn)
	if btn is PButton:
		tab_buttons.erase(btn)
		tab_content.get_node("modbutton_%s" % sn).queue_free()
		btn.queue_free()
	else:
		ModLoaderLog.error("尝试删除配置页但是没找到ModTab_%s" % sn, Constants.LOG_NAME)

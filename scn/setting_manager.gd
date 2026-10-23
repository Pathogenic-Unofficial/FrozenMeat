extends Node

static var optionMenu
static var settings: Dictionary[StringName, PackedScene] = {}
static var Constants = preload("res://mods-unpacked/FallingShrimp-FrozenMeat/constants.gd")

func addSetting(sn: StringName, scene: PackedScene):
	if sn in settings:
		ModLoaderLog.error("添加设置页“%s”失败" % sn, Constants.LOG_NAME)
	else:
		settings[sn] = scene
func removeSetting(sn: StringName):
	if sn not in settings:
		ModLoaderLog.error("删除设置页“%s”失败" % sn, Constants.LOG_NAME)
	else:
		optionMenu.removeSetting(sn)
		settings.erase(sn)

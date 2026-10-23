static var settings: Dictionary[StringName, PackedScene] = {}
static var constants = preload("res://mods-unpacked/FallingShrimp-FrozenMeat/constants.gd")

static func addSetting(sn: StringName, scene: PackedScene):
	if sn in settings:
		ModLoaderLog.error("添加设置页“%s”失败" % sn, constants.LOG_NAME)
	else:
		settings[sn] = scene

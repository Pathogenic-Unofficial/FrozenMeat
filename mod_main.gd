extends Node

var mgr = preload("res://mods-unpacked/FallingShrimp-FrozenMeat/scn/setting_manager.gd")

func _init() -> void:
	for lang in ["en", "zh_CN"]:
		ModLoaderMod.add_translation("res://mods-unpacked/FallingShrimp-FrozenMeat/l10n/translations.%s.translation" % lang)
	ModLoaderMod.install_script_extension("res://mods-unpacked/FallingShrimp-FrozenMeat/scn/option_menu.gd")
	mgr.addSetting("frozenmeat", preload("res://mods-unpacked/FallingShrimp-FrozenMeat/scn/settings/fronzen_meat.tscn"))

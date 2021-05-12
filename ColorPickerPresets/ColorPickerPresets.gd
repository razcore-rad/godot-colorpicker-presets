tool
extends EditorPlugin


func _enter_tree() -> void:
	var presets := PoolColorArray()
	var presets_raw := PoolStringArray()
	var presets_file := File.new()

	if presets_file.open("res://presets.hex", File.READ) == OK:
		presets_raw = presets_file.get_as_text().split("\n")
		presets_file.close()

		for hex in presets_raw:
			if hex.is_valid_html_color():
				presets.push_back(Color(hex))
		get_editor_interface().get_editor_settings().set_project_metadata(
			"color_picker", "presets", presets
		)

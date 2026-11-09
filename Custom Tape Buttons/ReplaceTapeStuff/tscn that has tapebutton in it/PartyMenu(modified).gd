extends "res://menus/party/PartyMenu.gd"
#Tiny modification to change the menu into preloading the party character menu
func _on_check_character_option_chosen():
	assert (current_button != null and current_button.character != null)
	
	var menu = preload("res://mods/Custom Tape Buttons/ReplaceTapeStuff/tscn that has tapebutton in it/PartyCharacterMenu.tscn").instance()
	menu.battle = battle
	menu.character = current_button.character
	menu.tape = current_button.tape
	if hidden_char_names.size() == 0:
		menu.party = party
	MenuHelper.add_child(menu)
	yield (menu.run_menu(), "completed")
	MenuHelper.remove_child(menu)
	menu.queue_free()
	reset_party()
	update_ui()
	current_button.grab_focus()

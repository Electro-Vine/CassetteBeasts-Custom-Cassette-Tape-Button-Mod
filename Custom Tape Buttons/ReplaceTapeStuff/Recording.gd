extends "res://data/status_effect_scripts/Recording.gd"
#Script modified to add a move according to which tape was used.

#All elemental types to determine the specific elemental affinity boost tapes.
var typeair : Resource = load("res://data/elemental_types/air.tres")
var typeastral : Resource = load("res://data/elemental_types/astral.tres")
var typebeast : Resource = load("res://data/elemental_types/beast.tres")
var typeearth : Resource = load("res://data/elemental_types/earth.tres")
var typefire : Resource = load("res://data/elemental_types/fire.tres")
var typeice : Resource = load("res://data/elemental_types/ice.tres")
var typelightning : Resource = load("res://data/elemental_types/lightning.tres")
var typemetal : Resource = load("res://data/elemental_types/metal.tres")
var typeplant : Resource = load("res://data/elemental_types/plant.tres")
var typeplastic : Resource = load("res://data/elemental_types/plastic.tres")
var typepoison : Resource = load("res://data/elemental_types/poison.tres")
var typewater : Resource = load("res://data/elemental_types/water.tres")

var recordedtape
#variable to store the data of the type of recording tape used.
func end_recording(node):
	var char_sfx = node.fighter.get_character_sfx()

	var success = _is_successful(node)
	if success:
		node.battle.queue_camera_set_state("effect", [target.slot])
		node.battle.queue_animation(Bind.new(self, "_animate_recording_success", [node, target, target.slot]))
		
		if char_sfx:
			node.battle.queue_animation(Bind.new(node.fighter.slot, "play_voice", [char_sfx.recording_success]))
		
		var recorded_effect_node = StatusEffectNode.new()
		recorded_effect_node.effect = RecordedEffect
		recorded_effect_node.amount = 1
		target.status.add_effect_quietly(recorded_effect_node)
		
		assert (target.get_characters().size() == 1)
		var tape = MonsterTape.new()
		for character in target.get_characters():
			assert (character.active_tape != null)
			tape.form = character.active_tape.form
			
			if force_bootleg_type:
				tape.type_override = [force_bootleg_type]
			else:
				tape.type_override = character.active_tape.type_override.duplicate()
			tape.assign_initial_stickers(true, node.battle.rand)
			#Differentiating the type of cassette tapes used, and adding a move afterwards.
			if recordedtape == "shuck" :
				var addtapemove = preload("res://mods/Custom Tape Buttons/Cassette Tapes Types/MoveDetermineStickers/sticker_shucktaped.tres")
				tape.force_add_sticker(addtapemove)
			elif recordedtape == "optical" :
				var addtapemove = preload("res://mods/Custom Tape Buttons/Cassette Tapes Types/MoveDetermineStickers/sticker_opticaltaped.tres")
				tape.force_add_sticker(addtapemove)
			elif recordedtape == "air" :
				var addtapemove = preload("res://mods/Custom Tape Buttons/Cassette Tapes Types/MoveDetermineStickers/sticker_airtaped.tres")
				tape.force_add_sticker(addtapemove)
			elif recordedtape == "astral" :
				var addtapemove = preload("res://mods/Custom Tape Buttons/Cassette Tapes Types/MoveDetermineStickers/sticker_astraltaped.tres")
				tape.force_add_sticker(addtapemove)
			elif recordedtape == "beast" :
				var addtapemove = preload("res://mods/Custom Tape Buttons/Cassette Tapes Types/MoveDetermineStickers/sticker_beasttaped.tres")
				tape.force_add_sticker(addtapemove)
			elif recordedtape == "lightning" :
				var addtapemove = preload("res://mods/Custom Tape Buttons/Cassette Tapes Types/MoveDetermineStickers/sticker_electrictaped.tres")
				tape.force_add_sticker(addtapemove)
			elif recordedtape == "fire" :
				var addtapemove = preload("res://mods/Custom Tape Buttons/Cassette Tapes Types/MoveDetermineStickers/sticker_firetaped.tres")
				tape.force_add_sticker(addtapemove)
			elif recordedtape == "earth" :
				var addtapemove = preload("res://mods/Custom Tape Buttons/Cassette Tapes Types/MoveDetermineStickers/sticker_groundtaped.tres")
				tape.force_add_sticker(addtapemove)
			elif recordedtape == "ice" :
				var addtapemove = preload("res://mods/Custom Tape Buttons/Cassette Tapes Types/MoveDetermineStickers/sticker_icetaped.tres")
				tape.force_add_sticker(addtapemove)
			elif recordedtape == "metal" :
				var addtapemove = preload("res://mods/Custom Tape Buttons/Cassette Tapes Types/MoveDetermineStickers/sticker_metaltaped.tres")
				tape.force_add_sticker(addtapemove)
			elif recordedtape == "plant" :
				var addtapemove = preload("res://mods/Custom Tape Buttons/Cassette Tapes Types/MoveDetermineStickers/sticker_planttaped.tres")
				tape.force_add_sticker(addtapemove)
			elif recordedtape == "plastic" :
				var addtapemove = preload("res://mods/Custom Tape Buttons/Cassette Tapes Types/MoveDetermineStickers/sticker_plastictaped.tres")
				tape.force_add_sticker(addtapemove)
			elif recordedtape == "poison" :
				var addtapemove = preload("res://mods/Custom Tape Buttons/Cassette Tapes Types/MoveDetermineStickers/sticker_poisontaped.tres")
				tape.force_add_sticker(addtapemove)
			elif recordedtape == "water" :
				var addtapemove = preload("res://mods/Custom Tape Buttons/Cassette Tapes Types/MoveDetermineStickers/sticker_watertaped.tres")
				tape.force_add_sticker(addtapemove)
			elif recordedtape == "chrome" :
				var addtapemove = preload("res://mods/Custom Tape Buttons/Cassette Tapes Types/MoveDetermineStickers/sticker_chrometaped.tres")
				tape.force_add_sticker(addtapemove)
			
		if node.fighter.is_player_controlled():
			SaveState.stats.get_stat("recorded_species").report_event(tape.form)
		
		assert (node.fighter.get_characters().size() == 1)
		if node.battle.is_net_game:
			assert (node.fighter.is_player_controlled() or node.fighter.is_remote_player_controlled())
			node.battle.deferred_recordings.push_back(tape)
			node.battle.queue_message("BATTLE_RAID_DEFERRED_RECORDING", true)
			
		elif node.fighter.is_player_controlled():
			var show_data = MenuHelper.give_tape(tape, true, node.battle)
			node.battle.queue_animation(Bind.new(MenuHelper, "show_give_tape", [tape, node.battle, show_data]))
			
		else:
			
			var fighter_char = node.fighter.get_characters()[0].character
			fighter_char.tapes.push_back(tape)
		
	else:
		node.battle.queue_camera_set_state("effect", [node.fighter.slot])
		if char_sfx:
			node.battle.queue_animation(Bind.new(node.fighter.slot, "play_voice", [char_sfx.recording_failure]))
		var toast = node.battle.create_toast()
		toast.setup_text(toast_on_failure)
		node.battle.queue_play_toast(toast, node.fighter.slot)
	
	is_removable = true
	node.remove()
	
	if success:
		var damage = Damage.new()
		damage.damage = target.status.max_hp / 20 + 1
		damage.physicality = 1
		damage.hit_vfx = [preload("res://data/hit_vfx/hit.tres")]
		damage.tags = ["recording"]
		target.get_controller().take_damage(damage)
	
	node.battle.events.notify("recording_ending", {
		fighter = node.fighter, 
		target = target, 
		success = success
	})

func get_capture_chance(node)->Rational:
	var base_rate = tape_rate
	
	#determining the type of tape, using a unique property of each tape type.
	if tape_rate == -1 :
		if force_bootleg_type :
			recordedtape = "shuck"
		else :
			recordedtape = "optical"
	elif tape_rate == 350 :
		recordedtape = "chrome"
	elif tape_rate == 150 :
		#print(type_affinity)
		if type_affinity == typeair :
			recordedtape = "air"
			print("airtaped")
		elif type_affinity == typeastral :
			recordedtape = "astral"
			print("astraltaped")
		elif type_affinity == typebeast:
			recordedtape = "beast"
			print("beasttaped")
		elif type_affinity == typelightning :
			recordedtape = "lightning"
			print("lightningtaped")
		elif type_affinity == typefire :
			recordedtape = "fire"
			print("firetaped")
		elif type_affinity == typeearth :
			recordedtape = "earth"
			print("earthtaped")
		elif type_affinity == typeice :
			recordedtape = "ice"
			print("icetaped")
		elif type_affinity == typemetal :
			recordedtape = "metal"
			print("metaltaped")
		elif type_affinity == typeplant :
			recordedtape = "plant"
			print("planttaped")
		elif type_affinity == typeplastic : 
			recordedtape = "plastic"
			print("plastictaped")
		elif type_affinity == typepoison :
			recordedtape = "poison"
			print("poisontaped")
		elif type_affinity == typewater:
			recordedtape = "water"
			print("watertaped")
			
	if base_rate >= 0 and type_affinity and target.status.get_types().has(type_affinity):
		base_rate += type_affinity_rate_boost
	var char_node = target.get_characters()[0]
	var mon_rate: int = char_node.active_form.capture_rate
	
	if mon_rate == 0:
		return Rational.new(0, 1)
	
	assert (char_node.active_tape)
	if char_node.active_tape.is_bootleg() and mon_rate > 0:
		mon_rate = mon_rate / 2 + 1
	
	var mon_hp: int = target.status.hp
	var mon_max_hp: int = target.status.max_hp
	var mon_level: int = target.status.level
	var chance = BattleFormulas.get_capture_chance(mon_rate, base_rate, mon_hp, mon_max_hp, damage_dealt, damage_received, mon_level)
	
	if not node.battle.is_net_game:
		
		chance.multiply_ip(100 + SaveState.stats.get_stat("exchange_purchased").get_count("recording_success_rate") * 5, 100)
		if SaveState.party.fusion_meter.is_full():
			chance.multiply_ip(100 + SaveState.stats.get_stat("exchange_purchased").get_count("fusion_meter_recording") * 5, 100)
	
	if Debug.dev_mode:
		print("Capture chance calculation:")
		print("mon_rate: " + str(mon_rate))
		print("tape_rate: " + str(base_rate))
		print("mon_hp: " + str(mon_hp))
		print("mon_max_hp: " + str(mon_max_hp))
		print("mon_level: " + str(mon_level))
		print("damage_dealt: " + str(damage_dealt))
		print("damage_received: " + str(damage_received))
		print("Result: " + str(chance.to_float()))
	
	return chance

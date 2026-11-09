extends BlankTape

#This script was made to change the recording effect so that it references the replaced one.
const ReplaceRecordingEffect = preload("res://mods/Custom Tape Buttons/ReplaceTapeStuff/Recording.gd")

func _use_in_battle(_node, fighter, arg):
	assert (arg.has("target_slots"))
	assert (arg.target_slots.size() == 1)
	var target = arg.target_slots[0].get_fighter()
	assert (target is FighterNode)
	
	assert (is_instance_valid(fighter) and fighter is FighterNode)
	if not _is_usable(fighter, target):
		return false
	
	var effect = ReplaceRecordingEffect.new()
	effect.tape_rate = capture_rate
	effect.type_affinity = type_affinity
	effect.type_affinity_rate_boost = type_affinity_rate_boost
	effect.force_bootleg_type = force_bootleg_type
	effect.target = target
	fighter.status.add_effect(effect, 1)
	return true

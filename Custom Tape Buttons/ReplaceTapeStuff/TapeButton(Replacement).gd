extends "res://menus/party/TapeButton.gd"
#This is the main script that modifies the tape button texture.
#With every scene file rewired to reference the modified tapebutton using this script;

#Inserting the texture of the tape.
const SKETCH_TEXTURE = preload("res://mods/Custom Tape Buttons/Custom tapes/Sketchy cassette tape.png")
const SKETCH_BOOTLEG_TEXTURE = preload("res://mods/Custom Tape Buttons/Custom tapes/Sketchy + bootleg cassette tape.png")

const LOOM_TEXTURE = preload("res://mods/Custom Tape Buttons/Custom tapes/loomianTape.png")
const LOOM_BOOTLEG_TEXTURE = preload("res://mods/Custom Tape Buttons/Custom tapes/loomianTapeAce.png")

const EV_TEXTURE = preload("res://mods/Custom Tape Buttons/Custom tapes/Electrovine Tapes.png")
const EV_BOOTLEG_TEXTURE = preload("res://mods/Custom Tape Buttons/Custom tapes/Bootleg Electrovine tapes.png")
const PRELLA_TEXTURE = preload("res://mods/Custom Tape Buttons/Custom tapes/PrellaTape.png")
const PRELLA_BOOTLEG_TEXTURE =  preload("res://mods/Custom Tape Buttons/Custom tapes/BootlegPrellaTape.png")
const CREAVOLVE_TEXTURE =  preload("res://mods/Custom Tape Buttons/Custom tapes/CreavolveTape.png")
const CREAVOLVE_BOOTLEG_TEXTURE =  preload("res://mods/Custom Tape Buttons/Custom tapes/BootlegCreavolveTape.png")
const ZENTRA_TEXTURE =  preload("res://mods/Custom Tape Buttons/Custom tapes/ZentraTape.png")
const ZENTRA_BOOTLEG_TEXTURE =  preload("res://mods/Custom Tape Buttons/Custom tapes/BootlegZentraTape.png")
const KAYLEIGH_TEXTURE = preload("res://mods/Custom Tape Buttons/Custom tapes/Kayleighstyledtape.png")
const KAYLEIGH_BOOTLEG_TEXTURE = preload("res://mods/Custom Tape Buttons/Custom tapes/Kayleighstyledtapebootleg.png")
const EUGENE_TEXTURE = preload("res://mods/Custom Tape Buttons/Custom tapes/Eugenestyledtape.png")
const EUGENE_BOOTLEG_TEXTURE =  preload("res://mods/Custom Tape Buttons/Custom tapes/Eugenestyledtapebootleg.png")
const MEREDITH_TEXTURE =  preload("res://mods/Custom Tape Buttons/Custom tapes/Meredithstyledtape.png")
const MEREDITH_BOOTLEG_TEXTURE =  preload("res://mods/Custom Tape Buttons/Custom tapes/Meredithstyledtapebootleg.png")
const FELIX_TEXTURE =  preload("res://mods/Custom Tape Buttons/Custom tapes/Felixstyledtape.png")
const FELIX_BOOTLEG_TEXTURE =  preload("res://mods/Custom Tape Buttons/Custom tapes/Felixstyledtapebootleg.png")
const VIOLA_TEXTURE = preload("res://mods/Custom Tape Buttons/Custom tapes/Violastyledtape.png")
const VIOLA_BOOTLEG_TEXTURE = preload("res://mods/Custom Tape Buttons/Custom tapes/Violastyledtapebootleg.png")
const BARKLEY_TEXTURE = preload("res://mods/Custom Tape Buttons/Custom tapes/Barkleystyledtape.png")
const BARKLEY_BOOTLEG_TEXTURE =  preload("res://mods/Custom Tape Buttons/Custom tapes/Barkleystyledtapebootleg.png")
const SUNNY_TEXTURE =  preload("res://mods/Custom Tape Buttons/Custom tapes/Sunnystyledtape.png")
const SUNNY_BOOTLEG_TEXTURE =  preload("res://mods/Custom Tape Buttons/Custom tapes/Sunnystyledtapebootleg.png")

const SHUCK_TEXTURE = preload ("res://mods/Custom Tape Buttons/Cassette Tapes Types/Black_Shuck.png")
const OPTICAL_TEXTURE = preload ("res://mods/Custom Tape Buttons/Cassette Tapes Types/Optical.png")
const OPTICAL_BOOTLEG_TEXTURE = preload ("res://mods/Custom Tape Buttons/Cassette Tapes Types/Optical_Boot.png")
const AIR_TEXTURE = preload ("res://mods/Custom Tape Buttons/Cassette Tapes Types/Air.png")
const AIR_BOOTLEG_TEXTURE = preload ("res://mods/Custom Tape Buttons/Cassette Tapes Types/Air_Boot.png")
const ASTRAL_TEXTURE = preload ("res://mods/Custom Tape Buttons/Cassette Tapes Types/Astral.png")
const ASTRAL_BOOTLEG_TEXTURE = preload ("res://mods/Custom Tape Buttons/Cassette Tapes Types/Astral_Boot.png")
const BEAST_TEXTURE = preload ("res://mods/Custom Tape Buttons/Cassette Tapes Types/Beast.png")
const BEAST_BOOTLEG_TEXTURE = preload ("res://mods/Custom Tape Buttons/Cassette Tapes Types/Beast_Boot.png")
const ELECTRIC_TEXTURE = preload ("res://mods/Custom Tape Buttons/Cassette Tapes Types/Electric.png")
const ELECTRIC_BOOTLEG_TEXTURE = preload ("res://mods/Custom Tape Buttons/Cassette Tapes Types/Electric_Boot.png")
const FIRE_TEXTURE = preload ("res://mods/Custom Tape Buttons/Cassette Tapes Types/Fire.png")
const FIRE_BOOTLEG_TEXTURE = preload ("res://mods/Custom Tape Buttons/Cassette Tapes Types/Fire_Boot.png")
const GROUND_TEXTURE = preload ("res://mods/Custom Tape Buttons/Cassette Tapes Types/Ground.png")
const GROUND_BOOTLEG_TEXTURE = preload ("res://mods/Custom Tape Buttons/Cassette Tapes Types/Ground_Boot.png")
const ICE_TEXTURE = preload ("res://mods/Custom Tape Buttons/Cassette Tapes Types/Ice.png")
const ICE_BOOTLEG_TEXTURE = preload ("res://mods/Custom Tape Buttons/Cassette Tapes Types/Ice_Boot.png")
const METAL_TEXTURE = preload ("res://mods/Custom Tape Buttons/Cassette Tapes Types/Metal.png")
const METAL_BOOTLEG_TEXTURE = preload ("res://mods/Custom Tape Buttons/Cassette Tapes Types/Metal_Boot.png")
const PLANT_TEXTURE = preload ("res://mods/Custom Tape Buttons/Cassette Tapes Types/Plant.png")
const PLANT_BOOTLEG_TEXTURE = preload ("res://mods/Custom Tape Buttons/Cassette Tapes Types/Plant_Boot.png")
const PLASTIC_TEXTURE = preload ("res://mods/Custom Tape Buttons/Cassette Tapes Types/Plastic.png")
const PLASTIC_BOOTLEG_TEXTURE = preload ("res://mods/Custom Tape Buttons/Cassette Tapes Types/Plastic_Boot.png")
const POISION_TEXTURE = preload ("res://mods/Custom Tape Buttons/Cassette Tapes Types/Poison.png")
const POISION_BOOTLEG_TEXTURE = preload ("res://mods/Custom Tape Buttons/Cassette Tapes Types/Poison_Boot.png")
const WATER_TEXTURE = preload ("res://mods/Custom Tape Buttons/Cassette Tapes Types/Water.png")
const WATER_BOOTLEG_TEXTURE = preload ("res://mods/Custom Tape Buttons/Cassette Tapes Types/Water_Boot.png")
const CHROME_TEXTURE = preload ("res://mods/Custom Tape Buttons/Cassette Tapes Types/Chrome.png")
const CHROME_BOOTLEG_TEXTURE = preload ("res://mods/Custom Tape Buttons/Cassette Tapes Types/Chrome_Boot.png")

func set_tape(value: MonsterTape):
	tape = value
	
	if Engine.editor_hint:
		return 
	
	form = tape.create_form() if tape else null
	#Determining the texture used :
	#it checks the name of the moves included in a monster tape.
	#Some are based on if the monster form have a certain tag.
	#If a texture is already used, the lines of code lower would replace it.
	#If none are chosen, it reverts to normal texture.
	#If you want a texture to override another if both conditions are met, place it lower but above the last check.
	if tape:
		var tapecheckhalt
		var Hasmoves : Array = tape.get_moves()
		var Hasmovescheck : Array
		for moves in range(Hasmoves.size()) :
			Hasmovescheck.append(Hasmoves[moves].get_name())
		tapecheckhalt = 0
		
		if "Chrome Taped" in Hasmovescheck :
			texture_normal = CHROME_TEXTURE if not tape.is_bootleg() else CHROME_BOOTLEG_TEXTURE
			tapecheckhalt = 1
			
		if "Water-Filled Taped" in Hasmovescheck :
			texture_normal = WATER_TEXTURE if not tape.is_bootleg() else WATER_BOOTLEG_TEXTURE
			tapecheckhalt = 1
			
		if "Snakeskin Taped" in Hasmovescheck :
			texture_normal = POISION_TEXTURE if not tape.is_bootleg() else POISION_BOOTLEG_TEXTURE
			tapecheckhalt = 1
			
		if "Recycled Taped" in Hasmovescheck :
			texture_normal = PLASTIC_TEXTURE if not tape.is_bootleg() else PLASTIC_BOOTLEG_TEXTURE
			tapecheckhalt = 1
			
		if "Treebark Taped" in Hasmovescheck :
			texture_normal = PLANT_TEXTURE if not tape.is_bootleg() else PLANT_BOOTLEG_TEXTURE
			tapecheckhalt = 1
			
		if "Ferrichrome Taped" in Hasmovescheck :
			texture_normal = METAL_TEXTURE if not tape.is_bootleg() else METAL_BOOTLEG_TEXTURE
			tapecheckhalt = 1
			
		if "Ice-IX Taped" in Hasmovescheck :
			texture_normal = ICE_TEXTURE if not tape.is_bootleg() else ICE_BOOTLEG_TEXTURE
			tapecheckhalt = 1
			
		if "Ceramic Taped" in Hasmovescheck :
			texture_normal = GROUND_TEXTURE if not tape.is_bootleg() else GROUND_BOOTLEG_TEXTURE
			tapecheckhalt = 1
			
		if "Toaster Taped" in Hasmovescheck :
			texture_normal = FIRE_TEXTURE if not tape.is_bootleg() else FIRE_BOOTLEG_TEXTURE
			tapecheckhalt = 1
			
		if "Superconductive Taped" in Hasmovescheck :
			texture_normal = ELECTRIC_TEXTURE if not tape.is_bootleg() else ELECTRIC_BOOTLEG_TEXTURE
			tapecheckhalt = 1
			
		if "Faux Fur Taped" in Hasmovescheck :
			texture_normal = BEAST_TEXTURE if not tape.is_bootleg() else BEAST_BOOTLEG_TEXTURE
			tapecheckhalt = 1
			
		if "Ethereal Taped" in Hasmovescheck :
			texture_normal = ASTRAL_TEXTURE if not tape.is_bootleg() else ASTRAL_BOOTLEG_TEXTURE
			tapecheckhalt = 1
			
		if "Aerosol Taped" in Hasmovescheck :
			texture_normal = AIR_TEXTURE if not tape.is_bootleg() else AIR_BOOTLEG_TEXTURE
			tapecheckhalt = 1
			
		if "Optical Laser Taped" in Hasmovescheck :
			texture_normal = OPTICAL_TEXTURE if not tape.is_bootleg() else OPTICAL_BOOTLEG_TEXTURE
			tapecheckhalt = 1
			
		if "Black Shuck Taped" in Hasmovescheck :
			texture_normal = SHUCK_TEXTURE
			tapecheckhalt = 1
			
		if "Sunny Custom Tape" in Hasmovescheck : 
			texture_normal = SUNNY_TEXTURE if not tape.is_bootleg() else SUNNY_BOOTLEG_TEXTURE
			tapecheckhalt = 1
			
		if "Barkley Custom Tape" in Hasmovescheck : 
			texture_normal = BARKLEY_TEXTURE if not tape.is_bootleg() else BARKLEY_BOOTLEG_TEXTURE
			tapecheckhalt = 1
			
		if "Viola Custom Tape" in Hasmovescheck : 
			texture_normal = VIOLA_TEXTURE if not tape.is_bootleg() else VIOLA_BOOTLEG_TEXTURE
			tapecheckhalt = 1
			
		if "Felix Custom Tape" in Hasmovescheck : 
			texture_normal = FELIX_TEXTURE if not tape.is_bootleg() else FELIX_BOOTLEG_TEXTURE
			tapecheckhalt = 1
			
		if "Meredith Custom Tape" in Hasmovescheck : 
			texture_normal = MEREDITH_TEXTURE if not tape.is_bootleg() else MEREDITH_BOOTLEG_TEXTURE
			tapecheckhalt = 1
			
		if "Eugene Custom Tape" in Hasmovescheck : 
			texture_normal = EUGENE_TEXTURE if not tape.is_bootleg() else EUGENE_BOOTLEG_TEXTURE
			tapecheckhalt = 1
			
		if "Kayleigh Custom Tape" in Hasmovescheck : 
			texture_normal = KAYLEIGH_TEXTURE if not tape.is_bootleg() else KAYLEIGH_BOOTLEG_TEXTURE
			tapecheckhalt = 1
			
		if "Zentra Custom Tape" in Hasmovescheck : 
			texture_normal = ZENTRA_TEXTURE if not tape.is_bootleg() else ZENTRA_BOOTLEG_TEXTURE
			tapecheckhalt = 1
			
		if "Creavolve Custom Tape" in Hasmovescheck : 
			texture_normal = CREAVOLVE_TEXTURE if not tape.is_bootleg() else CREAVOLVE_BOOTLEG_TEXTURE
			tapecheckhalt = 1
			
		if "Prella Custom Tape" in Hasmovescheck : 
			texture_normal = PRELLA_TEXTURE if not tape.is_bootleg() else PRELLA_BOOTLEG_TEXTURE
			tapecheckhalt = 1
			
		if "Electro Vine Custom Tape" in Hasmovescheck : 
			texture_normal = EV_TEXTURE if not tape.is_bootleg() else EV_BOOTLEG_TEXTURE
			tapecheckhalt = 1
		
		if "metronette" in form.move_tags :
			texture_normal = LOOM_TEXTURE if not tape.is_bootleg() else LOOM_BOOTLEG_TEXTURE
			tapecheckhalt = 1
			
		if "Sketch_form" in form.move_tags : 
			texture_normal = SKETCH_TEXTURE if not tape.is_bootleg() else SKETCH_BOOTLEG_TEXTURE
			tapecheckhalt = 1
			print("Has_sketch_form")
				
		if tapecheckhalt == 0 :
			texture_normal = NORMAL_TEXTURE if not tape.is_bootleg() else BOOTLEG_TEXTURE
	else:
		texture_normal = EMPTY_TEXTURE
	
	if name_label:
		container.visible = tape != null
		behind_container.visible = tape != null
		overlay.visible = tape != null
		
		if tape:
			name_label.text = tape.get_name()
		else:
			name_label.text = form.name if form != null else "???"
		favorite_icon.visible = tape != null and tape.favorite
		
		grade_stars.set_grade(0 if tape == null else tape.grade)
		
		if tape:
			if not rewinding:
				hp_bar.value = tape.hp.to_int_ceil_nonzero(hp_bar.max_value)
				left_reel.progress = tape.hp.to_float()
				right_reel.progress = tape.hp.to_float()
			
			if tape.is_broken():
				modulate = Color(0.5, 0.5, 0.5, 1.0)
			else:
				modulate = Color.white
		
		var types = form.elemental_types if form != null else []
		for child in type_icon_container.get_children():
			type_icon_container.remove_child(child)
			child.queue_free()
		for type in types:
			var icon = TextureRect.new()
			icon.expand = true
			icon.rect_min_size = Vector2(42, 42)
			icon.size_flags_vertical = Control.SIZE_SHRINK_CENTER
			icon.texture = type.icon
			type_icon_container.add_child(icon)
		
		monster_sticker.texture = form.tape_sticker_texture if form else null
		
		exp_bar.set_max_exp_points(tape.get_exp_to_next_grade() if tape else 1)
		exp_bar.set_exp_points(tape.exp_points if tape else 0)

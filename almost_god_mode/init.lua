-- all functions below are optional and can be left out

--[[
	
	function OnModPreInit()
		print("Mod - OnModPreInit()") -- First this is called for all mods
	end
	
	function OnModInit()
		print("Mod - OnModInit()") -- After that this is called for all mods
	end
	
	function OnModPostInit()
		print("Mod - OnModPostInit()") -- Then this is called for all mods
	end
	
	function OnPlayerSpawned( player_entity ) -- This runs when player entity has been created
		GamePrint( "OnPlayerSpawned() - Player entity id: " .. tostring(player_entity) )
	end
	
	function OnWorldInitialized() -- This is called once the game world is initialized. Doesn't ensure any world chunks actually exist. Use OnPlayerSpawned to ensure the chunks around player have been loaded or created.
		GamePrint( "OnWorldInitialized() " .. tostring(GameGetFrameNum()) )
	end
	
	function OnWorldPreUpdate() -- This is called every time the game is about to start updating the world
		GamePrint( "Pre-update hook " .. tostring(GameGetFrameNum()) )
	end
	
	function OnWorldPostUpdate() -- This is called every time the game has finished updating the world
		GamePrint( "Post-update hook " .. tostring(GameGetFrameNum()) )
	end
	
	]]--
	
	-- This code runs when all mods' filesystems are registered
	-- ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/example/files/actions.lua" ) -- Basically dofile("mods/example/files/actions.lua") will appear at the end of gun_actions.lua  --original code
	-- ModMagicNumbersFileAdd( "mods/example/files/magic_numbers.xml" ) -- Will override some magic numbers using the specified file
	-- ModRegisterAudioEventMappings( "mods/example/files/audio_events.txt" ) -- Use this to register custom fmod events. Event mapping files can be generated via File -> Export GUIDs in FMOD Studio.
	-- ModMaterialsFileAdd( "mods/example/files/materials_rainbow.xml" ) -- Adds a new 'rainbow' material to materials
	
	--print("Example mod init done")
	
	
	
	dofile( "data/scripts/perks/perk.lua" ) -- we want us some perks boii
	-- dofile( "data/scripts/perks/perk_list.lua" ) -- we want us some perks boii
	-- ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "data/scripts/perks/perk.lua") -- Basically dofile("mods/example/files/actions.lua") will appear at the end of gun_actions.lua
	-- print("This is my mod to test mod, yes")
	
	
	
	
function OnPlayerSpawned( player_entity ) -- This runs when player entity has been created
		GamePrint( "OnPlayerSpawned() - Player entity id: " .. tostring(player_entity) )
		-- local init_check_flag = "start_loadouts_init_done"
		-- if GameHasFlagRun( init_check_flag ) then
		-- 	return
		-- end
		-- GameAddFlagRun( init_check_flag )

	local x,y = EntityGetTransform( player_entity )
	-- SetRandomSeed( x + 344, y - 523 )
	
	-- local perk_name = "EXTRA_HP"
	-- local perk_name = "PROTECTION_FIRE"
	local perk_names = {
		-- "ELECTRICITY", 
		"EDIT_WANDS_EVERYWHERE", 
		"MOVEMENT_FASTER",
		"EXTRA_HP",
		"HEARTS_MORE_EXTRA_HP",
		"PROTECTION_FIRE",
		"PROTECTION_EXPLOSION",
		"PROTECTION_ELECTRICITY",
		"PROTECTION_RADIOACTIVITY",
		"SHIELD",
		"EXTRA_PERK",
		"BREATH_UNDERWATER",
		"EXTRA_MONEY",
		"HOVER_BOOST"
	}

	for i, perk_name in ipairs (perk_names) do
	local perk_entity = perk_spawn(x, y, perk_name)
		if(perk_entity ~= nil) then
			-- GamePrint( "PERK NAME - Perk Name is: " .. perk_name )
			perk_pickup(perk_entity, player_entity, EntityGetName( perk_entity ), false, false)
		end
	end

end


	
	-- local loadout_rnd = Random( 1, #loadout_list )
	-- local loadout_choice = loadout_list[loadout_rnd]
	-- local loadout_name = loadout_choice.name

	-- if ( loadout_choice.perks ~= nil ) then
	-- 	for i,perk_name in ipairs( loadout_choice.perks ) do
	-- 		local perk_entity = perk_spawn( x, y, perk_name )
	-- 		if ( perk_entity ~= nil ) then
	-- 			perk_pickup( perk_entity, player_entity, EntityGetName( perk_entity ), false, false )
	-- 		end
	-- 	end	
	-- end
	
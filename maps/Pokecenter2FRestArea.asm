	object_const_def

Pokecenter2FRestArea_MapScripts:
	def_scene_scripts
	scene_script .InitializeRestArea ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED
	def_callbacks

.InitializeRestArea:
	sdefer .InitializeAndPreparePokecenter2F
	end

.DummyScene:
	end

.InitializeAndPreparePokecenter2F:
	setscene SCENE_FINISHED
	setmapscene POKECENTER_2F, SCENE_POKECENTER2F_LEAVE_REST_AREA
	end


Pokecenter2FRestAreaPassTime:
	faceplayer
	opentext
	checktime MORN
	iftrue .MornDay
	checktime DAY
	iftrue .DayNite
	checktime NITE
	iftrue .NiteMorn
	
.MornDay
	writetext RestAreaRestTilDayText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	special StubbedTrainerRankings_Healings
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special FadeInQuickly
	special RestartMapMusic
	opentext
	writetext RestAreaGetGoingText
	waitbutton
	closetext
	end
	
.DayNite
	writetext RestAreaRestTilNiteText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	special StubbedTrainerRankings_Healings
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special FadeInQuickly
	special RestartMapMusic
	opentext
	writetext RestAreaGetGoingText
	waitbutton
	closetext
	end
	
.NiteMorn
	writetext RestAreaRestTilMornText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	special StubbedTrainerRankings_Healings
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special FadeInQuickly
	special RestartMapMusic
	opentext
	writetext RestAreaGetGoingText
	waitbutton
	closetext
	end
	
Pokecenter2FRestAreaRadio:
	jumpstd Radio1Script

Pokecenter2FRestAreaTV:
	jumpstd TVScript

RestAreaRestTilMornText:
	text "<PLAYER> rested"
	line "until sunrise…"
	done

RestAreaRestTilDayText:
	text "<PLAYER> rested"
	line "until noon…"
	done

RestAreaRestTilNiteText:
	text "<PLAYER> rested"
	line "until nightfall…"
	done

RestAreaGetGoingText:
	text "…Okay! Better get"
	line "going!" 
	done

Pokecenter2FRestArea_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  1,  7, POKECENTER_2F, 5
	warp_event  2,  7, POKECENTER_2F, 5

	def_coord_events

	def_bg_events
	bg_event  1,  1, BGEVENT_READ, Pokecenter2FRestAreaTV
	bg_event  2,  1, BGEVENT_READ, Pokecenter2FRestAreaRadio
	bg_event  0,  3, BGEVENT_READ, Pokecenter2FRestAreaPassTime
	bg_event  0,  3, BGEVENT_READ, Pokecenter2FRestAreaPassTime
	bg_event  0,  6, BGEVENT_READ, Pokecenter2FRestAreaPassTime
	bg_event  3,  3, BGEVENT_READ, Pokecenter2FRestAreaPassTime
	bg_event  3,  6, BGEVENT_READ, Pokecenter2FRestAreaPassTime
	
	def_object_events
	
Route16_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .AlwaysOnBike
	callback MAPCALLBACK_TILES, .RoadClosed

.AlwaysOnBike:
	readvar VAR_YCOORD
	ifless 5, .CanWalk
	readvar VAR_XCOORD
	ifgreater 13, .CanWalk
	setflag ENGINE_ALWAYS_ON_BIKE
	endcallback

.CanWalk:
	clearflag ENGINE_ALWAYS_ON_BIKE
	endcallback
	
.RoadClosed:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .RoadUnblocked
	changeblock 15, 7, $1b ; road closed
.RoadUnblocked:
	endcallback

CyclingRoadSign:
	jumptext CyclingRoadSignText

CyclingRoadSignText:
	text "CYCLING ROAD"

	para "DOWNHILL COASTING"
	line "ALL THE WAY!"
	done

Route16_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  1, ROUTE_16_FUCHSIA_SPEECH_HOUSE, 1
	warp_event 14,  6, ROUTE_16_GATE, 3
	warp_event 14,  7, ROUTE_16_GATE, 4
	warp_event  9,  6, ROUTE_16_GATE, 1
	warp_event  9,  7, ROUTE_16_GATE, 2

	def_coord_events

	def_bg_events
	bg_event  5,  5, BGEVENT_READ, CyclingRoadSign

	def_object_events

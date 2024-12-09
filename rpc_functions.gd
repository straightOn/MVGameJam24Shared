extends Node

class_name RpcBase

const ObjectTypeResource = preload("res://shared/object_type.gd")
const GamePhaseResource = preload("res://shared/game_phase.gd")

# class defines all required methods client and server side
# will be inherited by client- and server-connection-handler and implement only the required functions
# params in (1,2,3)
# 1 authority parameter -> determines which peer can call the RPC function
# 	any_peer: allows any connected peer to call the function.
#	server: only allows the server to call the function.
# 
# 2 call local arameterp
# -> specifies whether the function should also be executed locally on the calling peer
# -> use this when you want the function to run on both the server and client that initiated the call.
# 	
# 3 transfer mode -> controls how the RPC data is sent over the network.
#	reliable: ensures that messages are delivered in order and without loss, but with higher latency.
#	unreliable: messages may be lost or arrive out of order, but are faster.
#	unreliable_ordered: messages are sent without guarantees of delivery but in order.

# client functions
@rpc
func receive_object_position_update(id: int, position: Vector2, direction: Vector2):
	#print_debug("receive_object_position_update called with data: ", id, position, direction)
	pass

@rpc
func receive_object_created(id: int, type: ObjectTypeResource.ObjectType, initial_position: Vector2, hp: float, max_hp: float, label: String):
	#print_debug("receive_object_created called with data", id, type, initial_position)
	pass 

@rpc
func receive_object_removed(id: int):
	#print_debug("receive_object_removed called with data", id)
	pass

# server functions
@rpc
func move_action(input: Vector2):
	#print_debug("move_action called with data: ", input)
	pass
	
@rpc
func join_game(label: String):
	#print_debug("join_game called", label)
	pass

@rpc
func receive_game_state(peer_id: int, active_connections: int, max_connections: int):
	#print_debug("receive_game_state called: %d" % active_connections)
	pass
	
@rpc("any_peer")
func receive_next_wave(wave: int):
	#print_debug("receive_next_wave called: ", wave)
	pass
	
@rpc("any_peer")
func receive_remaining_time(remaining: int):
	#print_debug("receive_remaining_time called: ", remaining)
	pass

@rpc("any_peer")
func receive_new_player_phase(id: int, new_phase: GamePhaseResource.Phase ):
	#print_debug("receive_new_player_phase called: ", id, new_phase)
	pass

@rpc("any_peer")
func receive_player_phase_remaining(id: int, remaining: int ):
	#print_debug("receive_player_phase_remaining called: ", id, remaining)
	pass
	
@rpc("any_peer")
func receive_object_takes_damage(id: int, damage: float, newHp: float):
	#print_debug("receive_object_takes_damage called: ", id, damage, newHp)
	pass
	
@rpc("any_peer")
func receive_object_attacks(id: int, direction: Vector2):
	#print_debug("receive_object_attacks called: ", id, direction)
	pass
	
@rpc("any_peer")
func receive_level_up(id: int, level: int, newHp: float, newMaxHp: float):
	#print_debug("level_up called: ", id, level, newHp, newMaxHp)
	pass
	
@rpc("any_peer")
func receive_remaining_phase_time(id: int, seconds: float):
	#print_debug("remaining_phase_time called: ", id, seconds)
	pass
	
@rpc("any_peer")
func receive_game_over(id: int, kills: int, alive_time: int):
	#print_debug("receive_game_over called: ", id, kills, alive_time)
	pass
	
	

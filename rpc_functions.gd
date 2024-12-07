extends Node

class_name RpcBase

const ObjectTypeResource = preload("res://shared/object_type.gd")

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
func receive_object_created(id: int, type: ObjectTypeResource.ObjectType, initial_position: Vector2):
	#print_debug("receive_object_created called with data", id, type, initial_position)
	pass

@rpc
func receive_object_removed(id: int):
	print_debug("receive_object_removed called with data", id)

# server functions
@rpc
func move_action(input: Vector2):
	#print_debug("move_action called with data: ", input)
	pass
	
@rpc
func join_game():
	print_debug("join_game called")

@rpc
func receive_game_state(active_connections: int, max_connections: int):
	print_debug("receive_game_state called: %d" % active_connections)
	
@rpc("any_peer")
func receive_next_wave(wave: int):
	print_debug("receive_next_wave called: ", wave)
	
@rpc("any_peer")
func receive_player_takes_damage(id: int, damage: float, newHp: float, newMaxHp: float):
	print_debug("receive_player_takes_damage called: ", id, damage, newHp, newMaxHp)
	
@rpc("any_peer")
func receive_enemy_takes_damage(id: int, damage: float, newHp: float, newMaxHp: float):
	print_debug("receive_enemy_takes_damage called: ", id, damage, newHp, newMaxHp)
	
@rpc("any_peer")
func receive_object_takes_damage(id: int, damage: float, newHp: float, newMaxHp: float):
	print_debug("receive_object_takes_damage called: ", id, damage, newHp, newMaxHp)

@rpc("any_peer")
func receive_object_attacks(id: int, direction: Vector2):
	print_debug("receive_object_attacks called: ", id, direction)
	
@rpc("any_peer")
func receive_switch_player_phase(id: int, phase: int):
	print_debug("receive_switch_player_phase called: ", phase)
	
@rpc("any_peer")
func receive_level_up(id: int, level: int, newHp: float, newMaxHp: float):
	print_debug("level_up called: ", id, level, newHp, newMaxHp)
	
@rpc("any_peer")
func receive_remaining_phase_time(id: int, seconds: float):
	print_debug("remaining_phase_time called: ", id, seconds)
	

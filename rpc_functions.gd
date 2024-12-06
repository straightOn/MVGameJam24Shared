extends Node

class_name RpcBase

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
func receive_object_position_update(id: int, position: Vector2):
	print_debug("receive_object_position_update called with data: ", id, position)

@rpc
func receive_object_created(id: int, type: String, initial_position: Vector2):
	print_debug("receive_object_created called with data", id, type, initial_position)

@rpc
func receive_object_removed(id: int):
	print_debug("receive_object_removed called with data", id)

# server functions
@rpc
func move_action(input: Vector2):
	print_debug("move_action called with data: ", input)

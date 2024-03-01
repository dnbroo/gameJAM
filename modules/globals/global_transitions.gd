extends Node

enum TransitionState {
	BEGIN_INVESTIGATION,
	INCOMING_INVASION,
	INVASION_STARTED,
	INVASION_WANING,
	INVESTIGATION
}

var current_state : TransitionState = TransitionState.BEGIN_INVESTIGATION
var transition_timer : Timer

func _ready():
	transition_timer = Timer.new()
	add_child(transition_timer)
	transition_timer.connect("timeout", Callable(self, "_on_transition_timer_timeout"))
	start_transition(TransitionState.BEGIN_INVESTIGATION)

func start_transition(state: TransitionState, duration: float = 2.0):
	current_state = state
	transition_timer.wait_time = duration
	transition_timer.start()

func _on_transition_timer_timeout():
	match current_state:
		TransitionState.BEGIN_INVESTIGATION:
			print("Begin Investigation")
			# Add your code for Begin Investigation here
			start_transition(TransitionState.INCOMING_INVASION)
			
		TransitionState.INCOMING_INVASION:
			print("Incoming Invasion")
			# Add your code for Incoming Invasion here
			start_transition(TransitionState.INVASION_STARTED)

		TransitionState.INVASION_STARTED:
			print("Invasion Started")
			# Add your code for Invasion Started here
			start_transition(TransitionState.INVASION_WANING)

		TransitionState.INVASION_WANING:
			print("Invasion Waning")
			# Add your code for Invasion Waning here
			start_transition(TransitionState.INVESTIGATION)

		TransitionState.INVESTIGATION:
			print("Investigation")
			# Add your code for Investigation here
			start_transition(TransitionState.BEGIN_INVESTIGATION)

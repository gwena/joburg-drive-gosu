require_relative 'autonomous_vehicle'

class Pickup < AutonomousVehicle
  NB_FRAME_PROBALITY_TO_TURN_IN_CYCLE = 60
  def initialize(window)
    super(window, 400, 650, 1, 0, "media/img/cars/Pickup.png")
    @current_action = :stop
  end

  def update
    next_index = 1 + ACTIONS.index(@current_action)
    next_index = 0 if next_index == ACTIONS.size
    @current_action = ACTIONS[next_index] if rand(NB_FRAME_PROBALITY_TO_TURN_IN_CYCLE) == 0
    send(@current_action)
    super
  end
end

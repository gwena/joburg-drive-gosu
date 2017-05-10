require_relative 'vehicle'

class AutonomousVehicle < Vehicle
  ACTIONS = [:right, :down, :left, :up, :stop]
  NB_FRAME_PROBALITY_TO_CHANGE = 200

  def update
    @current_action = ACTIONS[rand(ACTIONS.size)] if rand(NB_FRAME_PROBALITY_TO_CHANGE) == 0
    send(@current_action)
    super
  end
end

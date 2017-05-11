require_relative 'vehicle'

class AutonomousVehicle < Vehicle
  ACTIONS = %i[right down left up stop].freeze
  AVERAGE_FRAME_B4_CHANGE = 200

  def update
    @current_action = ACTIONS[rand(ACTIONS.size)] if rand(AVERAGE_FRAME_B4_CHANGE).zero?
    send(@current_action)
    super
  end
end

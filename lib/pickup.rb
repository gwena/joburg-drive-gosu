require_relative 'autonomous_vehicle'

class Pickup < AutonomousVehicle
  AVERAGE_FRAME_B4_TURNING = 60

  def initialize(window)
    super(window, 400, 650, 1, 0, 'media/img/cars/Pickup.png')
    @current_action = :stop
  end

  def update
    next_index = 1 + ACTIONS.index(@current_action)
    next_index = 0 if next_index == ACTIONS.size
    @current_action = ACTIONS[next_index] if rand(AVERAGE_FRAME_B4_TURNING).zero?
    send(@current_action)
    super
  end
end

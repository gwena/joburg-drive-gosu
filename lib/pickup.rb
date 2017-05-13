require_relative 'autonomous_vehicle'

class Pickup < AutonomousVehicle
  AVERAGE_FRAME_B4_TURNING = 60

  def initialize(window)
    super(window, 400, 650, 1, 0, 'media/img/cars/Pickup.png')
    @dir = :stop
  end

  def update
    next_index = 1 + DIRS.index(@dir)
    next_index = 0 if next_index == DIRS.size
    @dir = DIRS[next_index] if rand(AVERAGE_FRAME_B4_TURNING).zero?
    send(@dir)
    super
  end
end

require_relative 'autonomous_vehicle'

# The South African Pickup called Bakkie
class Pickup < AutonomousVehicle
  AVERAGE_FRAME_B4_TURNING = 60

  def initialize(window)
    super(window, 100, 150)
    @dir = :stop
  end

  def image
    'Pickup.png'
  end

  def update
    next_index = 1 + DIRS.index(@dir)
    next_index = 0 if next_index == DIRS.size
    @dir = DIRS[next_index] if rand(AVERAGE_FRAME_B4_TURNING).zero?
    super
  end
end

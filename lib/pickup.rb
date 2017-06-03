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
    if turn?
      next_index = 1 + DIRS.index(@dir)
      next_index = 0 if next_index == DIRS.size
      @dir = DIRS[next_index]
    end
    super
  end

  def turn?
    rand(AVERAGE_FRAME_B4_TURNING).zero?
  end
end

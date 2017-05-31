require_relative 'autonomous_vehicle'

# Police car
class Police < AutonomousVehicle
  def initialize(window)
    super(window, 100, 150)
    @dir = :stop
  end

  def image
    'Police-State-1.png'
  end

  def speed
    2
  end

  def update
    @dir = DIRS[rand(DIRS.size)] if rand(AVERAGE_FRAME_B4_CHANGE).zero?
    super
  end
end

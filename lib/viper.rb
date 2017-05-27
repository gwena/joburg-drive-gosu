require_relative 'autonomous_vehicle'

# Fast autonomous car
class Viper < AutonomousVehicle
  def initialize(window)
    super(window, 400, 450)
    @dir = :stop
  end

  def image
    'BlackViper.png'
  end

  def speed
    3
  end

  def update
    @dir = DIRS[rand(DIRS.size)] if rand(AVERAGE_FRAME_B4_CHANGE).zero?
    super
  end
end

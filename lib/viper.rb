require_relative 'autonomous_vehicle'

# Fast autonomous car
class Viper < AutonomousVehicle
  def initialize(window)
    super(window, 400, 450, 3)
    @dir = :stop
  end

  def update
    @dir = DIRS[rand(DIRS.size)] if rand(AVERAGE_FRAME_B4_CHANGE).zero?
    super
  end

  def image
    'Black_viper.png'
  end
end

require_relative 'autonomous_vehicle'

# Fast autonomous car
class Viper < AutonomousVehicle
  def initialize(window)
    super(window, 400, 450, 3, 0)
    @dir = :stop
  end

  def image
    'Black_viper.png'
  end
end

require_relative 'autonomous_vehicle'

# Fast autonomous car
class Viper < AutonomousVehicle
  def initialize(window)
    super(window, 400, 450, 1, 0, 'media/img/cars/Black_viper.png')
    @dir = :stop
  end
end

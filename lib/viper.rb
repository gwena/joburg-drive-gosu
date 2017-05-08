require_relative 'autonomous_vehicle'

class Viper < AutonomousVehicle
  def initialize(window)
    super(window, 400, 450, 1, 0, "media/img/cars/Black_viper.png")
    @current_action = :stop
  end
end

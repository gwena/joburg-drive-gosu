require_relative 'autonomous_vehicle'

class Pickup < AutonomousVehicle
  def initialize(window)
    super(window, 400, 650, 1, 0, "media/img/cars/Pickup.png")
    @current_action = :stop
  end
end

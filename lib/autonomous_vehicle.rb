require_relative 'vehicle'

class AutonomousVehicle < Vehicle
  DIRS = %i[right down left up stop].freeze
  AVERAGE_FRAME_B4_CHANGE = 200

  def update
    @dir = DIRS[rand(DIRS.size)] if rand(AVERAGE_FRAME_B4_CHANGE).zero?
    send(@dir)
    super
  end

end

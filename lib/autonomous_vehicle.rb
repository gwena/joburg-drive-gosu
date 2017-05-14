require_relative 'vehicle'

# Superclass for all the autonomous vehicles
# Basic random intelligence is implemented
class AutonomousVehicle < Vehicle
  DIRS_NO_STOP = %i[right down left up].freeze
  DIRS = [*DIRS_NO_STOP, :stop].freeze

  PADDING = 25
  AVERAGE_FRAME_B4_CHANGE = 200

  def update
    # Implement in the subclass the specifics and call super
    stay_inside
    send(@dir)
    super
  end

  def stay_inside
    avoid_boundary(:up) if @y < PADDING
    avoid_boundary(:left) if @x < PADDING
    avoid_boundary(:down) if @y > @window.y - PADDING
    avoid_boundary(:right) if @x > @window.x - PADDING
  end

  def avoid_boundary(dir)
    return unless @dir.eql?(dir)

    options = DIRS.reject { |d| d == dir }
    @dir = options[rand(options.size)]
  end
end

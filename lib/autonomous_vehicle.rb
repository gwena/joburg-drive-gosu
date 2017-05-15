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
    valid_dirs = valid_directions
    @dir = valid_dirs[rand(valid_dirs.size)] if valid_dirs.size != DIRS.size
  end

  def valid_directions
    valid_dirs = [:stop]
    valid_dirs << :up if @y > PADDING
    valid_dirs << :left if @x > PADDING
    valid_dirs << :down if @y < @window.height - PADDING
    valid_dirs << :right if @x < @window.width - PADDING
    valid_dirs
  end
end

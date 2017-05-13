require_relative 'vehicle'

class AutonomousVehicle < Vehicle
  DIRS_NO_STOP = %i[right down left up].freeze
  DIRS = [*DIRS_NO_STOP, :stop].freeze

  PADDING = 25
  AVERAGE_FRAME_B4_CHANGE = 200

  def update
    @dir = DIRS[rand(DIRS.size)] if rand(AVERAGE_FRAME_B4_CHANGE).zero?
    stay_inside
    send(@dir)
    super
  end

  def stay_inside
    @dir = other_dir(:up) if @dir.eql?(:up) && @y < PADDING
    @dir = other_dir(:left) if @dir.eql?(:left) && @x < PADDING
    @dir = other_dir(:down) if @dir.eql?(:down) && @y + PADDING > @window.y
    @dir = other_dir(:right) if @dir.eql?(:right) && @x + PADDING > @window.x
  end

  def other_dir(exclude)
    options = DIRS.reject { |d| d == exclude }
    options[rand(options.size)]
  end
end

require_relative 'autonomous_vehicle'

# Police car
class Police < AutonomousVehicle
  def initialize(window)
    super(window, 100, 150)
    @dir = :stop
    load_images
    @image = @images[0]
  end

  def image(index)
    "Police-State-#{index}.png"
  end

  def load_images
    @images = []
    states.each_with_index do |i|
      @images << Gosu::Image.new("media/img/cars/#{image(i)}")
    end
  end

  def states
    1..1
  end

  def speed
    2
  end

  def update
    @dir = DIRS[rand(DIRS.size)] if rand(AVERAGE_FRAME_B4_CHANGE).zero?
    super
  end
end

require_relative 'autonomous_vehicle'

# Police car
class Police < AutonomousVehicle
  STATES = 1..3

  def initialize(window)
    super(window, window.width - 50, window.height - 50)
    @dir = :stop
    @image = @images[0]
    @nb_tick = 0
    @follow = window.player
  end

  def image(index)
    "Police-State-#{index}.png"
  end

  def load_images
    @images = []
    STATES.each_with_index do |i|
      @images << Gosu::Image.new(CARS + image(i))
    end
  end

  def speed
    2
  end

  def update
    maybe_change_dir
    follow_on_y if follow_player?
    follow_on_x if follow_player?
    @nb_tick += 1
    @image = @images[(@nb_tick / 15) % STATES.size]
    super
  end

  def follow_on_y
    @dir = :left if @x > @follow.x
    @dir = :right if @x < @follow.x
  end

  def follow_on_x
    @dir = :up if @y > @follow.y
    @dir = :down if @y < @follow.y
  end

  def follow_player?
    rand(AVERAGE_FRAME_B4_CHANGE / 2).zero?
  end
end

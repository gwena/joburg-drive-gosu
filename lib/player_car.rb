require_relative 'vehicle'

# The player's car driven with the keyboard
class PlayerCar < Vehicle
  def initialize(window)
    super(window, window.width / 2, window.height / 2)
  end

  def image
    'Trashmaster.png'
  end

  def speed
    3
  end

  def update
    move(:up,    Gosu::KbUp,    @y > PADDING)
    move(:left,  Gosu::KbLeft,  @x > PADDING)
    move(:down,  Gosu::KbDown,  @y < @tiles.height - PADDING)
    move(:right, Gosu::KbRight, @x < @tiles.width - PADDING)
    super
  end

  def move(dir, key, inside)
    send(dir) if @window.button_down?(key) && inside
  end
end

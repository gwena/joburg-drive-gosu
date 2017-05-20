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
    up if @window.button_down?(Gosu::KbUp) && @y > PADDING
    left if @window.button_down?(Gosu::KbLeft) && @x > PADDING
    down if @window.button_down?(Gosu::KbDown) && @y < @tiles.height - PADDING
    right if @window.button_down?(Gosu::KbRight) && @x < @tiles.width - PADDING
    super
  end
end

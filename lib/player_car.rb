require_relative 'vehicle'

# The player's car driven with the keyboard
class PlayerCar < Vehicle
  def initialize(window)
    super(window, window.width / 2, window.height / 2, 3, 0)
  end

  def image
    'Audi.png'
  end

  def update
    left if @window.button_down?(Gosu::KbLeft)
    right if @window.button_down?(Gosu::KbRight)
    up if @window.button_down?(Gosu::KbUp)
    down if @window.button_down?(Gosu::KbDown)
    super
  end
end

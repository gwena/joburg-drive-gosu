require_relative 'vehicule'

class PlayerCar < Vehicule
  def initialize(window)
    @HALF_WIDTH = window.width / 2
    @HALF_HEIGHT = window.height / 2
    super(window, @HALF_WIDTH, @HALF_HEIGHT, 3, 0, "media/img/cars/Audi.png" )
  end

  def update
    left if @window.button_down?(Gosu::KbLeft)
    right if @window.button_down?(Gosu::KbRight)
    up if @window.button_down?(Gosu::KbUp)
    down if @window.button_down?(Gosu::KbDown)
    super
  end

  def draw
    @image.draw_rot(@HALF_WIDTH, @HALF_HEIGHT, 1, @transition_angle)
  end
end

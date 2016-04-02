require_relative 'vehicule'

class PlayerCar < Vehicule
  def initialize(window)
    super(window, window.width / 2, window.height / 2, 3, 0, "media/Cars/Audi.png" )
  end

  def update
    left if @window.button_down?(Gosu::KbLeft)
    right if @window.button_down?(Gosu::KbRight)
    up if @window.button_down?(Gosu::KbUp)
    down if @window.button_down?(Gosu::KbDown)
    super
  end

  def left
    @x -= @speed
    turning(270)
  end

  def right
    @x += @speed
    turning(90)
  end

  def up
    @y -= @speed
    turning(0)
  end

  def down
    @y += @speed
    turning(180)
  end
end

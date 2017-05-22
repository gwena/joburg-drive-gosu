require 'gosu'

# Superclass for all the Waste types
class Waste
  attr_reader :x, :y

  def initialize(window, x, y)
    @window, @x, @y = window, x, y
    @image = Gosu::Image.new("media/img/waste/#{image}")
  end

  def update
    raise NotImplementedError, 'update() needs to be implemented in the Waste subclasses'
  end

  def draw
    @image.draw_rot(@x - @window.x, @y - @window.y, 1, 0)
  end
end

require 'gosu'

# Superclass for all the Waste types
class Waste
  attr_reader :x, :y

  def initialize(window, x, y)
    @window, @x, @y = window, x, y
    @nb_tick = 0
    load_images
  end

  def load_images
    @images = []
    states.each_with_index do |i|
      @images << Gosu::Image.new("media/img/waste/#{image(i)}")
    end
  end

  def update
    @nb_tick += 1
  end

  def draw
    @images[state].draw_rot(@x - @window.x, @y - @window.y, 1, 0)
  end

  def vanished?
    state >= states.last
  end

  def state
    @nb_tick / nb_tick_in_state
  end

  def states
    1..1
  end

  def nb_tick_in_state
    raise NotImplementedError 'Needs to be implemented in the Waste subclasses'
  end
end

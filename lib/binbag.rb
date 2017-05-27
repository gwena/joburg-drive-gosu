require_relative 'waste'

# The standard black bin bag
class Binbag < Waste
  def initialize(window, x, y)
    super(window, x, y)
  end

  def image(index)
    "Binbags-State-#{index}.png"
  end

  def states
    1..4
  end

  def nb_tick_in_state
    60 * 2
  end
end

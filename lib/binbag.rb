require_relative 'waste'

# The standard black bin bag
class Binbag < Waste
  def initialize(window, x, y)
    super(window, x, y)
  end

  def image
    'Binbags-State-1.png'
  end

  def states
    1..1 # @TODO to change after
  end

  def nb_tick_in_state
    60 * 1
  end
end

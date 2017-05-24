require_relative 'waste'

# The standard black bin bag
class Binbag < Waste
  def initialize(window, x, y)
    super(window, x, y)
  end

  def image
    'Binbags-State-1.png'
  end

  def update
    # in fact have might have nothing here!
  end
end

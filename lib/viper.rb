require_relative 'vehicule'

class Viper < Vehicule
  ACTIONS = [:left, :right, :up, :down, :stop]

  def initialize(window)
    super(window, 400, 450, 1, 0, "media/Cars/Black_viper.png")
    @current_action = :stop
  end

  def update
    if rand(200) == 0 then
      @current_action = ACTIONS[rand(4)]
      send(@current_action)
    else
      send(@current_action)
    end
    super
  end

end

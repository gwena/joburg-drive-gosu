require_relative 'autonomous_vehicle'

class MinibusTaxi < AutonomousVehicle
  MAX_DRIFT = 20
  OFFSET_PER_DRIFT = 0.25

  def initialize(window)
    super(window, 500, 450, 0.5, 0, 'media/img/cars/MinibusTaxi.png')
    @stop_sound = Gosu::Sample.new(window, 'media/sound/carscreech.wav')
    @current_action = :stop
    @nb_drift = 0
    @offset_dir = OFFSET_PER_DRIFT
  end

  def update
    super
    drift
  end

  def stop
    @stop_sound.play
    super
  end

  def drift
    return if @current_action == :stop
    @nb_drift += 1
    if @nb_drift == MAX_DRIFT
      @nb_drift = 0
      @offset_dir *= -1
    end
    if @target_angle.zero? || @target_angle == 180
      @x += @offset_dir
    else
      @y += @offset_dir
    end
  end
end

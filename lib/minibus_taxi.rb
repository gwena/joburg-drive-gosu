require_relative 'autonomous_vehicle'

# South African taxi with heratic behavior and drifting on the road
class MinibusTaxi < AutonomousVehicle
  MAX_DRIFT = 20
  OFFSET_PER_DRIFT = 0.25

  def initialize(window)
    super(window, 500, 450)
    @breaking_sound = Gosu::Sample.new('media/sound/carscreech.wav')
    @dir = :stop
    @nb_drift = 0
    @offset_dir = OFFSET_PER_DRIFT
  end

  def speed
    0.5
  end

  def image
    'MinibusTaxi.png'
  end

  def update
    @dir = DIRS[rand(DIRS.size)] if rand(AVERAGE_FRAME_B4_CHANGE).zero?
    super
    drift
  end

  def stop
    @breaking_sound.play(0.03,7)
    super
  end

  def drift
    return if @dir == :stop
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

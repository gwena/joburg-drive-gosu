require 'gosu'

class Vehicule

  ANGLE_INCREMENT = 6

  attr_reader :x, :y

  def initialize(window, x, y, speed, target_angle, image_file)
    @window = window
    @x = x
    @y = y
    @speed = speed
    @target_angle = target_angle
    @transition_angle = @target_angle
    @angle_increment = ANGLE_INCREMENT
    @image = Gosu::Image.new image_file
  end

  def turning(new_angle)
    if @target_angle != new_angle then
      # @transition_angle = @target_angle
      @target_angle = new_angle
      rotation_direction
    end
  end

  def rotation_direction
    if (@target_angle - @transition_angle) > (@transition_angle - @target_angle) then
      @angle_increment = ANGLE_INCREMENT
    else
      @angle_increment = -ANGLE_INCREMENT
    end
  end

  def update
    @transition_angle += @angle_increment if @target_angle != @transition_angle
  end

  def draw
    @image.draw_rot(@x, @y, 1, @transition_angle)
  end
end

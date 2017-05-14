require 'gosu'

# Superclass for all the Vehicle types
class Vehicle
  ANGLE_INCREMENT = 6

  attr_reader :x, :y

  def initialize(window, x, y, speed, target_angle)
    @window = window
    @tiles = window.tiles
    @x = x
    @y = y
    @speed = speed
    @target_angle = target_angle
    @transition_angle = @target_angle
    @angle_increment = ANGLE_INCREMENT
    @image = Gosu::Image.new("media/img/cars/#{image}")
  end

  def left
    @x -= @speed
    turn(270)
  end

  def right
    @x += @speed
    turn(90)
  end

  def up
    @y -= @speed
    turn(0)
  end

  def down
    @y += @speed
    turn(180)
  end

  def stop; end

  def turn(new_angle)
    if @target_angle != new_angle
      @target_angle = new_angle
      rotation_direction
    end
  end

  def rotation_direction
    angle = @target_angle - @transition_angle
    @angle_increment = if (angle <= -180) || (angle >= 0 && angle < 180)
                         ANGLE_INCREMENT
                       else
                         -ANGLE_INCREMENT
                       end
  end

  def update
    if @target_angle != @transition_angle
      @transition_angle += @angle_increment
      @transition_angle = @target_angle if @transition_angle % 360 == @target_angle
    end
  end

  def draw
    @image.draw_rot(@x - @window.x, @y - @window.y, 1, @transition_angle)
  end
end

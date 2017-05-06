require 'gosu'

class Vehicule

  ANGLE_INCREMENT = 6

  attr_reader :x, :y

  def initialize(window, map, x, y, speed, target_angle, image_file)
    @window = window
    @map = map
    @x = x
    @y = y
    @speed = speed
    @target_angle = target_angle
    @transition_angle = @target_angle
    @angle_increment = ANGLE_INCREMENT
    @image = Gosu::Image.new image_file
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

  def stop 
  end

  def turn(new_angle)
    if @target_angle != new_angle then
      @target_angle = new_angle
      rotation_direction
    end
  end

  def rotation_direction
    angle = @target_angle - @transition_angle
    if (angle <= -180) || (angle >= 0 && angle < 180) then
      @angle_increment = ANGLE_INCREMENT
    else
      @angle_increment = -ANGLE_INCREMENT
    end
  end

  def update
    if @target_angle != @transition_angle then
      @transition_angle += @angle_increment 
      @transition_angle = @target_angle if @transition_angle % 360  == @target_angle
    end
  end

  def draw
    @image.draw_rot(@x - @window.x, @y - @window.y, 1, @transition_angle)
  end
end

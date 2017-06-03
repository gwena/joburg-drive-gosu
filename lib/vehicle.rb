require 'gosu'

# Superclass for all the Vehicle types
class Vehicle
  ANGLE_INCREMENT = 6
  PADDING = 25
  CARS = 'media/img/cars/'

  attr_reader :x, :y

  def initialize(window, x, y)
    @window, @x, @y = window, x, y
    @tiles = window.tiles
    @target_angle = 0
    @transition_angle = @target_angle
    @angle_increment = ANGLE_INCREMENT
    load_images
  end

  def load_images
    @image = Gosu::Image.new(CARS + image)
  end

  def speed
    1
  end

  def left
    @x -= speed
    turn(270)
  end

  def right
    @x += speed
    turn(90)
  end

  def up
    @y -= speed
    turn(0)
  end

  def down
    @y += speed
    turn(180)
  end

  def stop; end

  def turn(new_angle)
    return if @target_angle == new_angle
    @target_angle = new_angle
    rotation_direction
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
    return if @target_angle == @transition_angle
    @transition_angle += @angle_increment
    @transition_angle = @target_angle if @transition_angle % 360 == @target_angle
  end

  def draw
    @image.draw_rot(@x - @window.x, @y - @window.y, 1, @transition_angle, 0.5, 0.5, 0.4, 0.4)
  end
end

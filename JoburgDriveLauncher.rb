require 'gosu'
require 'gosu_tiled'

class GameWindow < Gosu::Window
  WIDTH = 1024
  HEIGHT = 800

  def initialize
    super(WIDTH, HEIGHT, {fullscreen: true})
    # super(WIDTH, HEIGHT, false)
    @map = Gosu::Tiled.load_json(self, 'JoburgDriveTmx.json')
    @car = Gosu::Image.new "media/Cars/Audi.png"
    @other_car = Gosu::Image.new "media/Cars/Black_viper.png"
    @x = @y = 0
    @speed = 3
    @target_angle = 0
    @transition_angle = @target_angle
    @angle_increment = 6
  end

  def turning(angle)
    if @target_angle != angle then
      @transition_angle = @target_angle
      @target_angle = angle
    end
  end

  def update
    if button_down?(Gosu::KbLeft) then
      @x -= @speed
      turning(-90)
    end
    if button_down?(Gosu::KbRight) then
      @x += @speed
      turning(90)
    end
    if button_down?(Gosu::KbUp) then
      @y -= @speed
      turning(0)
    end
    if button_down?(Gosu::KbDown) then
      @y += @speed
      turning(180)
    end
    
    @transition_angle += @angle_increment if @target_angle > @transition_angle
    @transition_angle -= @angle_increment if @target_angle < @transition_angle
  end

  def draw
    @car.draw_rot(WIDTH/2, HEIGHT/2, 1, @transition_angle)
    @map.draw(@x, @y)
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end
end

GameWindow.new.show

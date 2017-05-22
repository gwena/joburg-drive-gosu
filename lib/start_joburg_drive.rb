#!/usr/bin/env ruby

require 'gosu'
require 'gosu_tiled'
require_relative 'player_car'
require_relative 'viper'
require_relative 'minibus_taxi'
require_relative 'pickup'
require_relative 'binbag'

# Main window and game loop
class GameWindow < Gosu::Window
  WIDTH = 1024
  HEIGHT = 800

  HALF_WIDTH = WIDTH / 2
  HALF_HEIGHT = HEIGHT / 2

  attr_reader :x, :y, :tiles

  def initialize
    super(WIDTH, HEIGHT, false) # { fullscreen: true } )
    @tiles = Gosu::Tiled.load_json(self, 'JoburgDriveTmx.json')
    @x = 0
    @y = 0

    @player = PlayerCar.new(self)
    @cars = []
    @cars << @player
    @cars << Viper.new(self)
    @cars << MinibusTaxi.new(self)
    @cars << Pickup.new(self)

    @waste = []

    @pothole = Gosu::Image.new('media/img/icon/Pothole.png')
  end

  def update
    @waste << Binbag.new(self, @x + rand(WIDTH), @y + rand(HEIGHT)) if rand(300).zero?

    @cars.map(&:update)
    @waste.map(&:update)
    @x = calculate_x
    @y = calculate_y
    self.caption = "#{Gosu.fps} FPS. Loc: [#{@x}:#{@y}] [#{@player.x}:#{@player.y}]. Use arrow keys"
  end

  def calculate_x
    return 0 if @player.x < HALF_WIDTH
    return @tiles.width - WIDTH if @player.x + HALF_WIDTH > @tiles.width
    @player.x - HALF_WIDTH
  end

  def calculate_y
    return 0 if @player.y < HALF_HEIGHT
    return @tiles.height - HEIGHT if @player.y + HALF_HEIGHT > @tiles.height
    @player.y - HALF_HEIGHT
  end

  def draw
    @cars.map(&:draw)
    @waste.map(&:draw)
    @tiles.draw(@x, @y)
    @pothole.draw(5, 5, 1)
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end
end

GameWindow.new.show

#!/usr/bin/env ruby

require 'gosu'
require 'gosu_tiled'
require_relative 'player_car'
require_relative 'viper'
require_relative 'minibus_taxi'
require_relative 'pickup'

class GameWindow < Gosu::Window
  WIDTH = 1024
  HEIGHT = 800

  HALF_WIDTH = WIDTH / 2
  HALF_HEIGHT = HEIGHT / 2

  attr_reader :x,  :y, :tiles

  def initialize
    super(WIDTH, HEIGHT, false) # { fullscreen: true } )
    @tiles = Gosu::Tiled.load_json(self, 'JoburgDriveTmx.json')
    @x, @y = 0, 0

    @player = PlayerCar.new(self)
    @cars = []
    @cars << @player
    @cars << Viper.new(self)
    @cars << MinibusTaxi.new(self)
    @cars << Pickup.new(self)
  end

  def update
    @cars.map { |car| car.update }

    @x = case 
         when @player.x < HALF_WIDTH
           0
         when @player.x + HALF_WIDTH > @tiles.width
           @tiles.width - WIDTH
         else
           @player.x - HALF_WIDTH
         end

    @y = case
         when @player.y < HALF_HEIGHT
           0
         when @player.y + HALF_HEIGHT > @tiles.height
           @tiles.height - HEIGHT
         else
           @player.y - HALF_HEIGHT
         end

    self.caption = "#{Gosu.fps} FPS. Loc: [#{@x}:#{@y}] [#{@player.x}:#{@player.y}]. Use arrow keys"
  end

  def draw
    @cars.map { |car| car.draw }
    @tiles.draw(@x, @y)
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end
end

GameWindow.new.show

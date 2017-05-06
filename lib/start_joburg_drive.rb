#!/usr/bin/env ruby

require 'gosu'
require 'gosu_tiled'
require_relative 'player_car'
require_relative 'viper'
require_relative 'minibus_taxi'

class GameWindow < Gosu::Window
  WIDTH = 1024
  HEIGHT = 800

  HALF_WIDTH = WIDTH / 2
  HALF_HEIGHT = HEIGHT / 2

  attr_reader :x,  :y

  def initialize
    super(WIDTH, HEIGHT, false) # { fullscreen: true } )
    @tiles = Gosu::Tiled.load_json(self, 'JoburgDriveTmx.json')
    @x, @y = 0, 0
    @player = PlayerCar.new(self, @tiles)
    @viper = Viper.new(self, @tiles)
    @minibus = MinibusTaxi.new(self, @tiles)
  end

  def update
    @player.update
    @viper.update
    @minibus.update
    @x = @player.x - HALF_WIDTH
    @y = @player.y - HALF_HEIGHT
    self.caption = "#{Gosu.fps} FPS. Loc: [#{@x}:#{@y}] [#{@player.x}:#{@player.y}]. Use arrow keys"
  end

  def draw
    @player.draw
    @viper.draw
    @minibus.draw
    @tiles.draw(@x, @y)
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end
end

GameWindow.new.show

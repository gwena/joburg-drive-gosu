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

  def initialize
    super(WIDTH, HEIGHT, false) # { fullscreen: true } )
    @map = Gosu::Tiled.load_json(self, 'JoburgDriveTmx.json')
    @player = PlayerCar.new(self)
    @viper = Viper.new(self)
    @minibus = MinibusTaxi.new(self)
  end

  def update
    @player.update
    @viper.update
    @minibus.update
    self.caption = "#{Gosu.fps} FPS. Loc: [#{@player.x}:#{@player.y}]. Use arrow keys"
  end

  def draw
    @player.draw
    @viper.draw
    @minibus.draw
    @map.draw(@player.x - HALF_HEIGHT, @player.y - HALF_WIDTH)
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end
end

GameWindow.new.show

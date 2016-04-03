require 'gosu'
require 'gosu_tiled'
require_relative 'player_car'
require_relative 'viper'

class GameWindow < Gosu::Window
  WIDTH = 1024
  HEIGHT = 800

  def initialize
    super(WIDTH, HEIGHT, false) # { fullscreen: true } )
    @map = Gosu::Tiled.load_json(self, 'JoburgDriveTmx.json')
    @player = PlayerCar.new(self)
    @viper = Viper.new(self)
  end

  def update
    @player.update
    @viper.update
  end

  def draw
    @player.draw
    @viper.draw
    @map.draw(@player.x, @player.y)
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end
end

GameWindow.new.show

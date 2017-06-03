#!/usr/bin/env ruby

require 'gosu'
require 'gosu_tiled'
require_relative 'player_car'
require_relative 'viper'
require_relative 'minibus_taxi'
require_relative 'pickup'
require_relative 'police'
require_relative 'binbag'

# Main window and game loop
class GameWindow < Gosu::Window
  WIDTH = 1024
  HEIGHT = 800

  HALF_WIDTH = WIDTH / 2
  HALF_HEIGHT = HEIGHT / 2

  OFFSET_BOARD = 4

  attr_reader :x, :y, :tiles, :player

  def initialize
    super(WIDTH, HEIGHT, false) # { fullscreen: true } )
    @tiles = Gosu::Tiled.load_json(self, 'JoburgDriveTmx.json')
    @x, @y = 0, 0

    @player = PlayerCar.new(self)
    @waste = []
    init_autonomous_cars
    init_board
  end

  def init_autonomous_cars
    @cars = []
    @cars << @player
    @cars << Viper.new(self)
    @cars << MinibusTaxi.new(self)
    @cars << Pickup.new(self)
    @cars << Police.new(self)
  end

  def init_board
    @font = Gosu::Font.new(40)
    @board = Gosu::Image.new('media/img/icon/Scores-Background.png')
    @pothole = Gosu::Image.new('media/img/icon/Pothole.png')
  end

  def update
    @cars.map(&:update)
    @x = calculate_x
    @y = calculate_y
    waste_management
    self.caption = "#{Gosu.fps} FPS. Loc: [#{@x}:#{@y}] [#{@player.x}:#{@player.y}]. Use arrow keys"
  end

  def waste_management
    @waste << Binbag.new(self, @x + rand(WIDTH), @y + rand(HEIGHT)) if rand(300).zero?
    @waste.map(&:update)
    @waste.reject!(&:vanished?)
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
    draw_scores
  end

  def draw_scores
    pos_x = @player.x > 400 || @player.y > 250 ? OFFSET_BOARD : WIDTH - OFFSET_BOARD - @board.width
    @board.draw(pos_x, OFFSET_BOARD, 1)
    @font.draw(@waste.size, pos_x + 10, OFFSET_BOARD + 5, 1)

    @pothole.draw(pos_x + 100, 5, 1)
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end
end

GameWindow.new.show

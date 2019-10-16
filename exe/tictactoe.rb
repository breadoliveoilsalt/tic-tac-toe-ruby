#!/usr/local/bin/ruby

require 'require_all'
require_all 'lib'

configuration = GameConfig.preconfigured.set_up
TicTacToeGame.new(configuration).play_game

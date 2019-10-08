#!/usr/local/bin/ruby

require 'require_all'
require_all 'lib'

configuration = GameConfig.new.set_up
TicTacToeGame.new(configuration).start_game

#!/usr/local/bin/ruby

require 'require_all'
require_all 'lib'

game = ThreeByThreeTTTGame.new({
  board: ThreeByThreeTTTBoard.new,
  human_player_model: HumanPlayer
})

game.start_game

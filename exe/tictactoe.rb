#!/usr/local/bin/ruby

require 'require_all'
require_all 'lib'

game = TicTacToeGame.new(
  board: ThreeByThreeTTTBoard.new,
  rules: ThreeByThreeTTTRules.new,
  user_interface: ThreeByThreeTTTUserInterface.new,
  player_factory: ThreeByThreeTTTPlayerFactory.new
  number_of_players: 2
  number_of_human_players: 1
)

game.play_game

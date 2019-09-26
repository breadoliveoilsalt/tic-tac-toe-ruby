#!/usr/local/bin/ruby

require 'require_all'
require_all 'lib'

game = TicTacToeGame.new({
  board: ThreeByThreeTTTBoard.new,
  rules: ThreeByThreeTTTRules.new,
  user_interface: ThreeByThreeTTTUserInterface.new,
  human_player_model: HumanPlayer,
  computer_player_model: ThreeByThreeTTTComputerPlayer
})

game.play_game

require 'require_all'
require_all 'lib'

class TicTacToeGame

  attr_accessor :board, :rules, :user_interface, :player_factory, :game

  def initialize(
    board: ThreeByThreeTTTBoard.new,
    rules: ThreeByThreeTTTRules.new,
    user_interface: ThreeByThreeTTTUserInterface.new,
    player_factory: ThreeByThreeTTTPlayerFactory.new,
    number_of_players: 2,
    number_of_human_players: 1
    )
  end
end

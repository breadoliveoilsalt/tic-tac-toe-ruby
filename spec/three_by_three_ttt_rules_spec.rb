require_relative '../lib/three_by_three_ttt_rules.rb'
require_relative '../lib/three_by_three_ttt_board.rb'

#class TestObject
#  include ThreeByThreeTTTRules
#  
#  def initialize
#    @board = ThreeByThreeTTTBoard.new
#  end
#end

describe "ThreeByThreeTTTRules" do

  let(:rules) { ThreeByThreeTTTRules.new }
  let(:board) { ThreeByThreeTTTBoard.new }
end

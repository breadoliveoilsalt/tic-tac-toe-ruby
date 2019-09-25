require_relative '../lib/three_by_three_ttt_rules.rb'

class TestObject
  include ThreeByThreeTTTRules
end

describe "ThreeByThreeTTTRules" do

  let(:rules) { TestObject.new }

end

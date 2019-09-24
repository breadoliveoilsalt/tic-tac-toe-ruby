require_relative '../lib/three_by_three_ttt_user_prompts.rb'

describe "ThreeByThreeTTTUserPrompts" do 

  before(:each) do
    test_object = Object.new
    test_object.extend(ThreeByThreeTTTUserPrompts)
  end

end

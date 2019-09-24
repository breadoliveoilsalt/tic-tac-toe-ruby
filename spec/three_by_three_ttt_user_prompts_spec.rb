require_relative '../lib/three_by_three_ttt_user_prompts.rb'

class TestObject
  include ThreeByThreeTTTUserPrompts
end

describe "ThreeByThreeTTTUserPrompts" do 

  let(:test_object) { TestObject.new }

#  before(:each) do
#    test_object = Object.new
#    test_object.extend(ThreeByThreeTTTUserPrompts)
#  end

  describe "#welcome_user" do
    it "displays a welcome message to the console" do
      expected_message = <<~MESSAGE
        
        Welcome to Tic Tac Toe!

        MESSAGE

      expect{test_object.welcome_user}.to output(expected_message).to_stdout
    end
  end

end

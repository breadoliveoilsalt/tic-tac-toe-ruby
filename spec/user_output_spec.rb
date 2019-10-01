require_relative '../lib/user_output.rb'

describe UserOutput do

  let(:user_output) { UserOutput.new }

  describe "#render" do 
    
    it "prints a string passed in as an argument to $stdout" do
      mock_output = "This is a message to the user."

      expect($stdout).to receive(:puts).with(mock_output)

      user_output.render(mock_output)
    end

  end

end

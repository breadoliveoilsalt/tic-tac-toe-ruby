require_relative '../lib/user_console_output.rb'

describe UserConsoleOutput do

  let(:user_output_stream) { UserConsoleOutput.new }

  describe "#render" do 
    
    it "prints a string passed in as an argument to $stdout" do
      mock_output = "This is a message to the user."

      expect($stdout).to receive(:puts).with(mock_output)

      user_output_stream.render(mock_output)
    end

  end

end

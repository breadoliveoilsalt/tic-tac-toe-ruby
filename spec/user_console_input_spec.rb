require_relative '../lib/user_console_input.rb'

describe UserConsoleInput do

  let(:user_input) { UserConsoleInput.new }

  describe "#read_line" do

    it "returns a string corresponding to user input from $stdin" do
        mock_input = "I, the user, typed this in"

        allow($stdin).to receive(:gets).and_return(mock_input)
        
        expect(user_input.read_line).to eq(mock_input)
    end

  end

end

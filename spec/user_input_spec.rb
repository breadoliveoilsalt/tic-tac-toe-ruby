require_relative '../lib/user_input.rb'

describe UserInput do

  let(:user_input) { UserInput.new }

  describe "#read_line" do

    it "returns a string corresponding to user input from $stdin" do
      
        mock_input = "I, the user, typed this in"

        allow($stdin).to receive(:gets).and_return(mock_input)
        
        expect(user_input.read_line).to eq(mock_input)

    end

  end

end

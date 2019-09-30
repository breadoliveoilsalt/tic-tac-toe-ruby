require_relative '../lib/user_input_class.rb' # change name

describe UserInput do

  it "reads a line of input" do
    our_input_stream = StringIO.new(["user input\n"]) 
    input = UserInput.new(input_stream: our_input_stream)
    expect(UserInput.new.read_line).to be("user input")
  end

end

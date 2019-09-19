class Board

  def initialize
    @data = initial_data
  end

  def data
    @data
  end

  def initial_data
    [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def test_message
    print "Success!"
  end

  def test_message2
    <<~MESSAGE
      #{data[0]} | #{data[1]} | #{data[2]}
     -----------
      #{data[3]} | #{data[4]} | #{data[5]}
     -----------
      #{data[6]} | #{data[7]} | #{data[8]}
    MESSAGE
  end

  def test_message3
    <<~MESSAGE
      X | X | X
     -----------
      O | O | O
     -----------
      O | O | X
    MESSAGE
  end

  def printy
    puts test_message3
    puts data[0]
    puts test_message2
  end

end

b = Board.new
b.printy

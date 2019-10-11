class PlayerConfig

  attr_reader :user_interface, :player_factory, :human_player_model, :computer_player_model, :ai
  attr_accessor :players

  def initialize(user_interface:, player_factory:, human_player_model:, computer_player_model:, ai:)
    @user_interface = user_interface
    @player_factory = player_factory
    @human_player_model = human_player_model
    @computer_player_model = computer_player_model
    @ai = ai
    @players = [ ]
  end

  def set_up
    user_interface.show_welcome

    ["1", "2"].each do | player_number |
      get_player_info_and_create(player_number)
    end

    players
  end

  def get_player_info_and_create(player_number)
    player_type = user_interface.get_player_type(player_number)
    if player_type == "1"
      create_and_add_human_player
    elsif player_type = "2"
      create_and_add_computer_player
    end
  end

  def create_and_add_human_player
    name = user_interface.get_name
    marker = user_interface.get_marker

    player = human_player_model.new({
      name: name,
      marker: marker,
      user_interface: user_interface
       })
    players.push(player)
  
  end

  def create_and_add_computer_player
    name = user_interface.get_name
    marker = user_interface.get_marker

    player = computer_player_model.new({
      name: name,
      marker: marker,
      ai: ai
      })
    players.push(player)
  end
end

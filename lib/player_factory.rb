class PlayerFactory

  attr_reader :user_interface,:human_player_model, :computer_player_model, :ai
  attr_accessor :players

  def set_up(user_interface:, human_player_model:, computer_player_model:, ai:)

    @user_interface = user_interface
    @human_player_model = human_player_model
    @computer_player_model = computer_player_model
    @ai = ai
    @players = [ ]

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
    elsif player_type == "2"
      create_and_add_computer_player
    end
  end

  def create_and_add_human_player
    attributes = get_name_and_marker_attributes.merge({user_interface: user_interface})
    player = human_player_model.new(attributes)
    players.push(player)
  end

  def create_and_add_computer_player
    attributes = get_name_and_marker_attributes.merge({ai: ai})
    player = computer_player_model.new(attributes)
    players.push(player)
  end

  def get_name_and_marker_attributes
    name = user_interface.get_name
    marker = user_interface.get_marker
    {name: name, marker: marker}
  end
end

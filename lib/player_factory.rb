class PlayerFactory

  attr_reader :user_interface,:human_player_model, :computer_player_model, :ai, :validator
  attr_accessor :players

  def set_up(user_interface:, human_player_model:, computer_player_model:, ai:, validator:)

    @user_interface = user_interface
    @human_player_model = human_player_model
    @computer_player_model = computer_player_model
    @ai = ai
    @validator = validator
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
    attributes = {
      name: get_name,
      marker: get_marker,
      user_interface: user_interface
      }

    player = human_player_model.new(attributes)
    players.push(player)
  end

  def create_and_add_computer_player
    attributes = {
      name: get_name,
      marker: get_marker,
      ai: ai
      }

    player = computer_player_model.new(attributes)
    players.push(player)
  end

  def get_name
    name = user_interface.get_name
    while !(validator.name_selection_valid?(name))
      user_interface.show_selection_error
      name = user_interface.get_name
    end
    name
  end

  def get_marker
    marker = user_interface.get_marker
    while !(validator.marker_selection_valid?(marker))
      user_interface.show_selection_error
      marker = user_interface.get_marker
    end
    marker
  end

end

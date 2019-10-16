class PlayerFactoryValidations

  def marker_selection_valid?(player_selection)
    player_selection.length == 1
  end

  def name_selection_valid?(player_selection)
    player_selection.length > 0
  end

end

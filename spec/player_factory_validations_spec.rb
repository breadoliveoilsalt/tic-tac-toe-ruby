require_relative '../lib/player_factory_validations.rb'

describe PlayerFactoryValidations do

  let(:validator) { PlayerFactoryValidations.new }

  describe "#marker_selection_valid?" do

    it "returns true when the argument string has length of 1" do
      player_selection = "X"

      result = validator.marker_selection_valid?(player_selection)

      expect(result).to eq(true)
    end

    it "returns false when the argument string has length of 0" do
      player_selection = ""

      result = validator.marker_selection_valid?(player_selection)

      expect(result).to eq(false)
    end

    it "returns false when the argument string length greater than 1" do
      player_selection = "Oo"

      result = validator.marker_selection_valid?(player_selection)

      expect(result).to eq(false)
    end
  end

  describe "#name_selection_valid?" do

    it "returns true when the argument string has length greater than 0" do
      player_selection = "T"

      result = validator.name_selection_valid?(player_selection)

      expect(result).to eq(true)
    end

    it "returns false when the argument string has length of 0" do
      player_selection = ""

      result = validator.name_selection_valid?(player_selection)

      expect(result).to eq(false)
    end
  end

end

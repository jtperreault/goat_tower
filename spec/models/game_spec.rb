require 'rails_helper'

RSpec.describe Game, type: :model do
  describe "is invalid" do
    let!(:player) { create(:player) }
    let!(:game)   { create(:game, player: player) }

    it "without a player" do
      expect(build(:game, player: nil)).to be_invalid
    end

    it "without a level" do
      expect(build(:game, level: nil)).to be_invalid
    end

    it "with more than 1 active game per player" do
      expect(build(:game, player: player)).to be_invalid
    end
  end

  describe "becomes inactive" do
    it "when player health <= 0"
  end
end

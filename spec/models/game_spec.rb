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

  describe "#continue" do
    it "selects and applies situation from the next level"
  end

  describe "#end_game" do
    let(:game) { create(:game) }

    it "deactivates the game" do
      expect{ game.end_game }.to change{ game.active }.from(true).to(false)
    end
  end

  describe ".next_level" do
    let!(:level1) { create(:level, position: 1) }
    let!(:level2) { create(:level, position: 2) }
    let!(:game)   { create(:game, level: level1) }

    it "returns the next level" do
      expect(game.next_level).to eq(level2)
    end
  end
end

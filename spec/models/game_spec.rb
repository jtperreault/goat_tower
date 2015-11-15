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

    it "without player health" do
      expect(build(:game, player_health: nil)).to be_invalid
    end
  end

  describe "new game" do
    let(:player)    { create(:player) }
    let(:level)     { create(:level, position: 0) }
    let(:game)      { build(:game, player: player) }

    it "starts at level 0" do
      game.save
      expect(game.level).to eq(level)
    end
  end

  describe "#continue" do
    let(:player)    { create(:player) }
    let(:game)      { create(:game, player: player) }
    let(:level)     { create(:level, position: 1) }
    let(:level2)    { create(:level, position: 2) }
    let(:situation) { create(:situation, level: level) }

    it "moves the game forward a level" do
      expect{ game.continue }.to change{ game.level }.from(level).to(level2)
    end

    it "applies health change to the user" do
      expect{ game.continue }.to change{ game.player_health }.by(situation.health_change)
    end

    it "ends game if player health <= 0"
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

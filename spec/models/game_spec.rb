require 'rails_helper'

RSpec.describe Game, type: :model do
  describe "is invalid" do
    let!(:player) { create(:player) }
    let!(:game)   { create(:game, player: player) }

    it "with more than 1 active game per player" do
      expect(build(:game, player: player)).to be_invalid
    end

    it "without a player" do
      expect(build(:game, player: nil)).to be_invalid
    end

    it "without a level" do
      expect(build(:game, level: nil)).to be_invalid
    end

    it "without player health" do
      expect(build(:game, player_health: nil)).to be_invalid
    end
  end

  describe "new games" do
    let(:player)  { create(:player) }
    let!(:level)  { create(:level, position: 0) }
    let(:game)    { build(:game, player: player) }

    it "start at level 0" do
      game.save
      expect(game.level).to eq(level)
    end
  end

  describe ".continue" do
    let!(:player)      { create(:player) }
    let!(:level_0)     { create(:level, position: 0) }
    let!(:level_1)     { create(:level, position: 1) }
    let!(:game)        { create(:game, player: player) }
    let!(:situation_1) { create(:situation, level: level_1) }

    it "moves the game forward a level" do
      expect{ game.continue }.to change{ game.level }.from(level_0).to(level_1)
    end

    it "applies health change to the user" do
      expect{ game.continue }.to change{ game.player_health }.by(situation_1.health_change)
    end

    it "stores the last situation applied" do
      game.continue
      expect(game.situation).to eq(situation_1)
    end

    context "ends the game" do
      it "if player health <= 0" do
        game.player_health = 10
        expect{ game.continue }.to change{ game.active }.from(true).to(false)
      end

      it "if there is no next level" do
        expect{ game.continue }.to change{ game.active }.from(true).to(false)
      end
    end
  end

  describe ".next_level" do
    let!(:level_0) { create(:level, position: 0) }
    let!(:level_1) { create(:level, position: 1) }
    let!(:game)    { create(:game) }

    it "returns the next level" do
      expect(game.next_level).to eq(level_1)
    end
  end

  describe ".message" do
    let!(:level_0)     { create(:level, position: 0) }
    let!(:level_1)     { create(:level, position: 1) }
    let!(:situation_1) { create(:situation, level: level_1, description: 'you get kicked in the face by a goat') }
    let!(:game)        { create(:game) }

    before { game.continue }

    it "returns a string" do
      expect(game.message).to be_a(String)
    end

    it "matches the situation desecription" do
      expect(game.message).to eq(situation_1.description)
    end
  end

end

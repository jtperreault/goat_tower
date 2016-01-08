require 'rails_helper'

RSpec.describe Game, type: :model do
  describe "is invalid" do
    it "when player already has active game" do
      expect(Game.new(player: players(:active_player), player_health: 100)).to be_invalid
    end

    it "without a player" do
      expect(Game.new(player: nil, player_health: 100)).to be_invalid
    end

    it "without player health" do
      expect(Game.new(player: players(:inactive_player), player_health: nil)).to be_invalid
    end
  end

  describe "new games" do
    it "start at level 0" do
      game = Game.create(player: players(:inactive_player), player_health: 100)
      expect(game.level.position).to eq(0)
    end
  end

  describe ".continue" do
    let(:game) { games(:active_game) }

    it "moves the game forward a level" do
      expect{ game.continue }.to change{ game.level }.from(levels(:one)).to(levels(:two))
    end

    it "applies health change to the user" do
      expect{ game.continue }.to change{ game.player_health }.by(situations(:initial_kick).health_change)
    end

    it "stores the last situation applied" do
      game.continue
      expect(game.situation).to eq(situations(:initial_kick))
    end

    context "ends the game" do
      it "if player health <= 0" do
        game.player_health = 10
        expect{ game.continue }.to change{ game.active }.from(true).to(false)
      end

      it "if there is no next level" do
        game.level = levels(:penultimate)
        expect{ game.continue }.to change{ game.active }.from(true).to(false)
      end
    end
  end

  describe ".next_level" do
    let!(:game)    { games(:active_game) }

    it "returns the next level" do
      expect(game.next_level).to eq(levels(:two))
    end
  end

  describe ".message" do
    let!(:game)        { games(:active_game) }
    before { game.continue }

    it "returns a string" do
      expect(game.message).to be_a(String)
    end

    it "matches the situation desecription" do
      expect(game.message).to eq(situations(:initial_kick).description)
    end

    it "sends winning message"
    it "sends losing message"
  end

end

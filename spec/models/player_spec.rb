require 'rails_helper'

RSpec.describe Player, type: :model do
  describe "is invalid" do
    it "without a handle" do
      expect(build(:player, handle: nil)).to be_invalid
    end
  end

  describe "commands" do
    context 'with active game' do
      let(:player) { create(:player) }

      it "returns commands" do
        expect(player.commands).to include('start')
      end
    end

    context 'with no active game' do
      let(:player) { create(:player) }
      let!(:game)  { create(:game, player: player) }

      it "returns commands" do
        expect(player.commands).to include('continue')
      end
    end
  end

end

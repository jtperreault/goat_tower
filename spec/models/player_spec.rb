require 'rails_helper'

RSpec.describe Player, type: :model do
  describe "is invalid" do
    it "without a handle" do
      expect(Player.new(handle: nil)).to be_invalid
    end
  end

  describe "commands" do
    context 'with no active game' do
      it "returns commands" do
        expect(players(:inactive_player).commands).to include('start')
      end
    end

    context 'with active game' do
      it "returns commands" do
        expect(players(:active_player).commands).to include('continue')
      end
    end
  end

end

require 'rails_helper'

RSpec.describe Level, type: :model do
  describe "is invalid" do
    it "without a position" do
      expect(Level.new(position: nil)).to be_invalid
    end

    it "with duplicate position" do
      expect(Level.new(position: 0)).to be_invalid
    end
  end

  describe '.get_situation' do
    it 'returns a situation' do
      expect(levels(:two).get_situation).to be_a(Situation)
    end
  end
end

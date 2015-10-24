require 'rails_helper'

RSpec.describe Level, type: :model do
  describe "is invalid" do
    let!(:level) { create(:level, position: 1) }

    it "without a position" do
      expect(build(:level, position: nil)).to be_invalid
    end

    it "with duplicate position" do
      expect(build(:level, position: 1)).to be_invalid
    end
  end

  describe '.get_situation' do
    let!(:level) { create(:level) }
    let!(:situation) { create(:situation, level: level) }

    it 'returns a situation' do
      expect(level.get_situation).to be_a(Situation)
    end
  end
end

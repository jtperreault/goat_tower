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

  describe ".next" do
    let!(:level1) { create(:level, position: 1) }
    let!(:level2) { create(:level, position: 2) }

    it "returns the next level" do
      expect(level1.next).to eq(level2)
    end

    context "at last level" do
      it "returns nil" do
        expect(level2.next).to eq(nil)
      end
    end
  end
end

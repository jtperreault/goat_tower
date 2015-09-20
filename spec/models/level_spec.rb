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
end

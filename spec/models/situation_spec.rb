require 'rails_helper'

RSpec.describe Situation, type: :model do
  describe "is invalid" do
    it "without a level" do
      expect(build(:situation, level: nil)).to be_invalid
    end

    it "without a description" do
      expect(build(:situation, description: nil)).to be_invalid
    end

    it "without a health change" do
      expect(build(:situation, health_change: nil)).to be_invalid
    end
  end
end

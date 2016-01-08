require 'rails_helper'

RSpec.describe Situation, type: :model do
  describe "is invalid" do
    it "without a level" do
      expect(Situation.new(level: nil, description: 'something happened!', health_change: -20)).to be_invalid
    end

    it "without a description" do
      expect(Situation.new(level: levels(:two), description: nil, health_change: -20)).to be_invalid
    end

    it "without a health change" do
      expect(Situation.new(level: levels(:two), description: 'something happened!', health_change: nil)).to be_invalid
    end
  end
end

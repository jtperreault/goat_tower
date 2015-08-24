require 'rails_helper'

RSpec.describe Game, type: :model do
  describe "is invalid" do
    it "without a player"
    it "without a level"
    it "with more than 1 active game"
  end

  describe "becomes inactive" do
    it "when player health <= 0"
  end
end

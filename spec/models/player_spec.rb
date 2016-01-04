require 'rails_helper'

RSpec.describe Player, type: :model do
  describe "is invalid" do
    it "without a handle" do
      expect(build(:player, handle: nil)).to be_invalid
    end
  end

  describe "commands" do
    it "returns commands"
  end
end

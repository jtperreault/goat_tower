require 'rails_helper'

RSpec.describe 'Game creation', type: :request do
  context 'with valid data' do
    it 'creates a game' do
      post '/games', { player: { handle: 'jtperreault' } }
      puts response.body
      expect(response.status).to eq(201)
    end
  end

  context 'with an active game'
  context 'without a identifiable user' # aka a new user
end

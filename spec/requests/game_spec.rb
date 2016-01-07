require 'rails_helper'

RSpec.describe 'Game requests', type: :request do
  context 'creating a game' do
    context 'with valid data' do
      it 'creates a game' do
        post '/games', { player: { handle: 'jtperreault' } }
        expect(response.status).to eq(201)
      end
    end

    context 'with invalid data'
    context 'with an active game'
    context 'without a identifiable player'
  end

  context 'updating a game' do
    it 'continues'
    it 'ends'
    it 'replies with correct errors'
  end
end

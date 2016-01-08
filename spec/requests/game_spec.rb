require 'rails_helper'

RSpec.describe 'Game requests', type: :request do
  describe 'creating a game' do
    context 'with valid data' do
      let(:player) { players(:james) }

      before { post '/games', { player: { handle: player.handle } } }

      it 'responds with correct status' do
        expect(response.status).to eq(201)
      end

      it 'returns a game message' do
        expect(json['game']['message']).to eq('Game started!')
      end
    end

    context 'with invalid data'
    context 'with an active game'
    context 'without a identifiable player'
  end

  describe 'updating a game' do
    it 'continues'
    it 'ends'
    it 'replies with correct errors'
  end
end

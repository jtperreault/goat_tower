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

    context 'with invalid data' do
      it 'returns failing status'
      it 'returns contextual error message'
    end

    context 'with an active game' do
      it 'returns failing status'
      it 'returns contextual errors message'
    end

    context 'without a identifiable player' do
      it 'returns failing status'
      it 'returns contextual error message'
    end
  end

  describe 'updating a game' do
    it 'continues'
    it 'ends'
    it 'replies with correct errors'
  end
end

require 'rails_helper'

RSpec.describe 'Commands request', type: :request do
  context 'without sending player handle information' do
    before { get '/commands' }

    it 'replies with correct status' do
      expect(response.status).to eq(400)
    end

    it 'gives a usable errror message' do
      expect(response.body).to include('must include player handle')
    end
  end

  context 'when player does not exist' do
    before { get '/commands', params: { player: { handle: 'jtperreault' } } }

    it 'returns success status' do
      expect(response.status).to eq(200)
    end

    it 'supplies a list of available game commands' do
      expect(response.body).to include('start')
    end
  end

  context 'when player exists but has no active game' do
    let(:player) { players(:james) }
    before { get '/commands', params: { player: { handle: player.handle } } }

    it 'returns success status' do
      expect(response.status).to eq(200)
    end

    it 'supplies a list of available game commands' do
      expect(response.body).to include('start')
    end
  end

  context 'when player exists with active game'
end

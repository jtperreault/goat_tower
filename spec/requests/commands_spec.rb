require 'rails_helper'

RSpec.describe 'Commands request', type: :request do
  context 'without sending player/handle information' do
    it 'replies with correct status'
    it 'gives a usable errror message'
  end

  context 'when player does not exist' do
    before { get '/commands', { player: { handle: 'jtperreault' } } }

    it 'returns success status' do
      expect(response.status).to eq(200)
    end

    it 'supplies a list of available game commands' do
      expect(response.body).to include('start')
    end
  end

  context 'when player exists but has no active game' do
    let!(:player) { create(:player, handle: 'jtperreault') }
    before { get '/commands', { player: { handle: 'jtperreault' } } }

    it 'returns success status' do
      expect(response.status).to eq(200)
    end

    it 'supplies a list of available game commands' do
      expect(response.body).to include('start')
    end
  end

  context 'when player exists with active game'
end

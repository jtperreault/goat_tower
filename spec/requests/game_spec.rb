require 'rails_helper'

RSpec.describe 'Game requests', type: :request do
  describe 'creating a game' do
    context 'with valid data' do
      let(:player) { players(:james) }

      before { post '/games', params: { player: { handle: player.handle } } }

      it 'responds with correct status' do
        expect(response.status).to eq(201)
      end

      it 'returns a game message' do
        expect(json['data']['attributes']['message']).to eq('You enter the Goat Tower.')
      end
    end

    context 'without a identifiable player' do
      before { post '/games', params: { player: { handle: 'nonexistant_player' } } }

      it 'returns failing status' do
        expect(response.status).to eq(400)
      end

      it 'returns an error message' do
        expect(json['errors'].length).to eq(1)
      end
    end

    context 'with an active game' do
      before { post '/games', params: { player: { handle: players(:active_player).handle } } }

      it 'returns failing status' do
        expect(response.status).to eq(400)
      end

      it 'returns an error message' do
        expect(json['errors'].length).to eq(1)
      end
    end
  end

  describe 'updating a game' do
    let(:game) { games(:active_game) }
    let(:inactive_game) { games(:inactive_game) }

    context 'that is inactive' do
      before { patch "/games/#{inactive_game.id}", params: { player: { handle: players(:active_player).handle } } }

      it 'returns failing status' do
        expect(response.status).to eq(400)
      end

      it 'returns an error' do
        expect(json['errors'].length).to eq(1)
      end
    end

    context 'played by different player' do
      before { patch "/games/#{game.id}", params: { player: { handle: players(:james).handle } } }

      it 'returns failing status' do
        expect(response.status).to eq(400)
      end

      it 'returns an error' do
        expect(json['errors'].length).to eq(1)
      end
    end

    context 'with valid data' do
      before { patch "/games/#{game.id}", params: { player: { handle: players(:active_player).handle } } }

      it 'returns success status' do
        expect(response.status).to eq(200)
      end

      it 'returns a game message' do
        expect(json['data']['attributes']['message']).to be_present
      end

      it 'returns (next) game level' do
        expect(json['data']['relationships']['level']).to be_present
        expect(json['data']['attributes']['level-position']).to eq(1)
      end
    end
  end
end

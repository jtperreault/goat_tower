require 'rails_helper'

RSpec.describe 'Player creation' do
  context 'with valid information' do
    before { post '/players', params: { player: { handle: 'jtperreault' } } }

    it 'returns successful status' do
      expect(response.status).to eq(201)
    end
  end
end

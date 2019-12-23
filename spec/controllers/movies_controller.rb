require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  let(:user) {create(:user)}
  before(:each) do
    allow(controller).to receive(:authenticate_user!).and_return(true)
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe '#update' do
    let(:category) {create(:category)}
    let!(:movie) {create(:movie, category: category)}

    it 'updates rating' do
      request.headers["accept"] = 'application/json'
      patch :update, params: {id: Movie.first.id, rate: 7}
      expect(response).to be_successful
      expect(JSON.parse(response.body)['raiting']).to eq("7.0 avg of 1 users")
    end
  end
end

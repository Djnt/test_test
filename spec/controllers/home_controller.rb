require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let(:user) {create(:user)}
  before(:each) do
    allow(controller).to receive(:authenticate_user!).and_return(true)
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe '#index' do
    let(:category) {create(:category)}
    let!(:movie) {create(:movie, category: category)}

    it 'returns movies' do
      request.headers["accept"] = 'application/json'
      get :index
      expect(response).to be_successful
      expect(JSON.parse(response.body)['movies'].length).to eq(Movie.all.count)
    end
  end
end

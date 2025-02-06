require 'rails_helper'

RSpec.describe TastyChallenge::V1::Products, type: :request do
  describe 'GET /products' do
    it 'returns status 200' do
      get '/api/v1/products'

      expect(response).to have_http_status(:ok)
    end
  end
end

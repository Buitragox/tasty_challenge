# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TastyChallenge::API, type: :request do
  it 'returns 404 with an invalid resource path' do
    get '/api/random_path'
    expect(response).to have_http_status(:not_found)
    expect(response.parsed_body).to include('error' => 'Not found')
  end
end

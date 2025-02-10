module TastyChallenge
  class API < Grape::API
    prefix 'api'
    format :json

    group do
      version 'v1'
      mount TastyChallenge::V1::Products
    end

    # Handle 404 errors
    # This should stay at the end of this class
    route :any, '*path' do
      error!('Not found', 404)
    end
  end
end

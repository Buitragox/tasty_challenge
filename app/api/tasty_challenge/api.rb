module TastyChallenge
  class API < Grape::API
    prefix "api"

    group do
      version "v1"
      mount TastyChallenge::V1::Products
    end
  end
end

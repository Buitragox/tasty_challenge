module TastyChallenge::V1
  class Products < Grape::API
    resource :products do
      get do
        [{ name: "Cool product" }]
      end
    end
  end
end

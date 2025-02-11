module TastyChallenge
  class API < Grape::API
    prefix 'api'
    format :json

    group do
      version 'v1'
      mount TastyChallenge::V1::Products
    end

    add_swagger_documentation(
      mount_path: '/swagger_doc',
      info: { title: 'Swagger API' },
      produces: ['application/json'],
    )

    # Handle 404 errors
    # This should be after all other endpoints
    # route :any, '*path' do
    #   error!('Not found', 404)
    # end
  end
end

module TastyChallenge::V1
  class Products < Grape::API
    rescue_from ActiveRecord::RecordInvalid do |e|
      error!(e, 400)
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      error!(e, 404)
    end

    helpers do
      params :product do
        requires :name, type: String
        requires :price, type: BigDecimal
        requires :stock, type: Integer
      end
    end

    resource :products do
      get do
        Product.all
      end

      params do
        use :product
      end
      post do
        Product.create!(**declared(params))
      end

      route_param :id, type: Integer do
        get do
          Product.find(params[:id])
        end

        params do
          use :product
        end
        put do
          product = Product.find(params[:id])
          product.update!(**declared(params))
          product
        end

        delete do
          Product.find(params[:id]).destroy!
          status :no_content
        end
      end
    end
  end
end

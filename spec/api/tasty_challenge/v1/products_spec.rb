require 'rails_helper'

RSpec.describe TastyChallenge::V1::Products, type: :request do
  let(:api_path) { '/api/v1/products' }

  before do
    @products = create_list(:product, 5)
  end

  describe 'GET /products' do
    it 'returns status 200' do
      get api_path
      expect(response).to have_http_status(:ok)
    end

    it 'returns all products' do
      get api_path
      expect(response.media_type).to eq('application/json')
      expect(response.parsed_body.length).to eq(5)
    end
  end

  describe 'GET /products/:id' do
    it 'returns the product with a valid id' do
      product = @products.first
      get "#{api_path}/#{product.id}"
      expect(response.parsed_body).to include('id' => product.id,
                                              'name' => product.name,
                                              'price' => product.price.to_s,
                                              'stock' => product.stock)
    end

    it 'returns 404 if product not found' do
      get "#{api_path}/#{9999999}"
      expect(response).to have_http_status(:not_found)
      expect(response.media_type).to eq('application/json')
      expect(response.parsed_body).to include('error' => "Couldn't find Product with 'id'=9999999")
    end
  end

  describe 'POST /products' do
    context 'when params are valid' do
      let(:product_params) do
        {
          name: 'Product name',
          stock: 10,
          price: '50.99'
        }
      end

      it 'returns status 201' do
        post api_path, params: product_params
        expect(response).to have_http_status(:created)
      end

      it 'creates a new product' do
        expect do
          post api_path, params: product_params
        end.to change(Product, :count).by(1)
      end

      it 'returns the created product' do
        post api_path, params: product_params
        expect(response.parsed_body).to include(
          'name' => product_params[:name],
          'stock' => product_params[:stock],
          'price' => product_params[:price]
        )
      end
    end

    context 'when params are invalid' do
      it 'returns status 400 with missing parameters' do
        post api_path, params: { name: 'Name', stock: 10 }
        expect(response).to have_http_status(:bad_request)
        expect(response.parsed_body).to include('error' => 'price is missing')
      end

      it 'returns status 400 with invalid name' do
        post api_path, params: { name: 'aa', stock: 99, price: '100.99' }
        expect(response).to have_http_status(:bad_request)
        expect(response.parsed_body).to include('error' => 'Validation failed: Name is too short (minimum is 3 characters)')
      end

      it 'returns status 400 with invalid stock' do
        post api_path, params: { name: 'Name', stock: -99, price: '100.99' }
        expect(response).to have_http_status(:bad_request)
        expect(response.parsed_body).to include('error' => 'Validation failed: Stock must be greater than or equal to 0')
      end

      it 'returns status 400 with invalid price' do
        post api_path, params: { name: 'Name', stock: 10, price: '100.123456' }
        expect(response).to have_http_status(:bad_request)
        expect(response.parsed_body).to include('error' => 'Validation failed: Price must be a number with up to 3 decimal places')
      end
    end
  end

  describe 'PUT /products/:id' do
    let(:product) { @products.first }

    it 'returns status 200 with a valid id' do
      product.name = 'Updated Name'
      put "#{api_path}/#{product.id}", params: product.as_json
      expect(response).to have_http_status(:ok)
      expect(response.parsed_body).to include('name' => product.name)
    end

    it 'returns status 404 if product not found' do
      put "#{api_path}/#{9999999}", params: product.as_json
      expect(response).to have_http_status(:not_found)
      expect(response.parsed_body).to include('error' => "Couldn't find Product with 'id'=9999999")
    end
  end

  describe 'DELETE /products/:id' do
    it 'returns status 204 with a valid id' do
      product = @products.first
      delete "#{api_path}/#{product.id}"
      expect(response).to have_http_status(:no_content)
      expect { product.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end

    it 'returns status 404 if product not found' do
      delete "#{api_path}/#{9999999}"
      expect(response).to have_http_status(:not_found)
      expect(response.parsed_body).to include('error' => "Couldn't find Product with 'id'=9999999")
    end
  end
end
